#include <openssl/hmac.h>
#include <openssl/evp.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

static size_t BUF_SIZE = 8192;

static double
os_clock()
{
  return (double)clock() / (double)CLOCKS_PER_SEC;
}

int main(int argc, char **argv)
{
  char buf[BUF_SIZE];

  FILE *file = fopen("enwik8", "r");
  if (!file) {
    fprintf(stderr, "cannot open file\n");
    return 1;
  }

  double starttime = os_clock();
  HMAC_CTX *ctx = HMAC_CTX_new();
  if (!ctx) {
    fprintf(stderr, "HMAC_CTX_new error\n");
    return 1;
  }
  const char *key = "01234567890123456789012345678901";
  if (!HMAC_Init_ex(ctx, key, strlen(key), EVP_sha256(), NULL)) {
    fprintf(stderr, "HMAC_Init_ex error\n");
    return 1;
  }
  char *line;
  while ((line = fgets(buf, BUF_SIZE, file)) != NULL) {
    char *eol = strchr(line, '\n');
    size_t line_len = eol ? eol - line : strlen(line);
    if (!HMAC_Update(ctx, line, line_len)) {
      fprintf(stderr, "HMAC_Update error\n");
      return 1;
    }
  }
  unsigned int mac_len;
  if (!HMAC_Final(ctx, buf, &mac_len)) {
    fprintf(stderr, "HMAC_Final error\n");
    return 1;
  }
  double endtime = os_clock();
  printf("%f\n", endtime - starttime);
  for (int i = 0; i < mac_len; i++) {
    printf("%02x", (unsigned char)(buf[i]));
  }
  printf("\n");

  HMAC_CTX_free(ctx);
  fclose(file);
  return 0;
}
