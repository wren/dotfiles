# Encryption

This bundle uses [Mozilla SOPS](https://github.com/mozilla/sops),
[Age](https://github.com/FiloSottile/age) to manage encrypted files in this
dotfiles repo. It also uses a free [Doppler](https://www.doppler.com/) account,
if available, to store the encryption key outside of the repo (with a script to
retrieve it on install).

## Manual Steps
1. Sign up for a Doppler account

## Todo
- Make helper script
  1. Generate age key
  2. Encrypt age key (prompt for passphrase)
  3. Create doppler dotfiles project
  4. Upload age key to doppler dotfiles project (to prod config)
  5. Generate doppler service token for dotfiles project
  6. Encrypt doppler service token to local file (prompt for passphrase)
