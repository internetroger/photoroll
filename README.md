# photoroll

## Shopify Backend Developer Challenge

This project will be a quick Rails-based image uploader. I am focusing on proper auth and the ability to securely upload and delete images to start. 

### Caveat Emptor!

I have included some basic validations and security measures; they are by no means exhaustive. For example: passwords must be present, and they are hashed and securely stored, but I did not include checks on password strength for ease of testing. These can easily be added at a later date. Session management is done via cookies, which is a Rails default behavior. I have configured the production environment to require SSL for cookie transmission, but the development environment uses insecure transmission. Cookies expire upon logout or after 2 days. Routes have been restricted to disallow access to restricted resources via exploiting Rails path conventions. 

### Features

- Login/Signup/Logout
- Photo upload
- Secure image storage and deletion
- Public/private image designation
- File type validation to prevent malicious uploads
- Private images are only viewable by the user who uploaded them.
- 

### Technologies

- Rails 6
- Active Storage (image storage)
- `file_validators` gem for checking filetypes
- SQLite
- Active Model has_secure_password (Bcrypt for password management)
- Static code analysis via `brakeman` gem
- Additional static code analysis via `dawnscanner` gem

### Screenshots

## TODO

- [x] Add columns to Post to allow for public/private viewing
- [x] Implement login/signup
- [x] Create basic routes (login/signup/logout, home, upload, view, delete)
- [x] Create unstyled views
- [x] Properly store images
- [x] Filetype validation (only jpeg, jpg, and png for now)
- [x] Delete images
- [x] Secure image storage
- [ ] **Styling**
- [ ] Testing via RSpec
- [ ] Update readme with installation and usage sections
