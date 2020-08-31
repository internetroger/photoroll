# photoroll

## Shopify Backend Developer Challenge

This project will be a quick Rails-based image uploader. I am focusing on proper auth and the ability to securely upload and delete images to start.  

### Technologies

- Rails
- Active Storage (image storage)
- `file_validators` gem for checking filetypes
- SQLite
- Active Model has_secure_password (Bcrypt for password management)
- Possibly some JS, not sure yet if I want to do everything in ERB or not.

## TODO

- [x] Add columns to Post to allow for public/private viewing
- [x] Implement login/signup
- [x] Create basic routes (login/signup/logout, home, upload, view, delete)
- [x] Create unstyled views
- [x] Properly store images
- [x] Filetype validation (only jpeg, jpg, and png for now)
- [x] Delete images
- [ ] Secure image storage
- [ ] Secure image transmission/rendering
