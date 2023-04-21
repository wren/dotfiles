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
  1. Generate and encrypt age key (prompt for passphrase)
      ```sh
      ENCRYPTED_AGE_KEY="$(age-keygen | age -p -a)"
      ```
  2. Login to doppler
      ```sh
      doppler login
      ```
  3. Create doppler dotfiles project
      ```sh
      if ! doppler projects | grep dotfiles; then
        doppler projects create dotfiles
      fi
      ```
  4. Upload age key to doppler dotfiles project (to prod config)
      ```sh
      echo $ENCRYPTED_AGE_KEY | doppler secrets set --project dotfiles --config prd DOTFILES_KEY
      ```
  5. Generate doppler service token for dotfiles project
      ```sh
      # ???
      DOPPLER_TOKEN_UNENCRYPTED="$(doppler configs tokens create --project dotfiles --config prd dotfiles-repo --plain)"
      ```
  6. Encrypt doppler service token to local file (prompt for passphrase)
      ```sh
      # ???
      age -p -a -o DOPPLER_TOKEN <(echo $DOPPLER_TOKEN_UNENCRYPTED)
      ```
