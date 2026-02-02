# NairobiTalks-NCG Prototype Testing

## Test Accounts

The prototype has been seeded with two test accounts for evaluating functionality:

### Admin User
- **Email**: admin@nairobi.gov
- **Password**: admin123
- **Role**: Administrator
- **Access**: Full admin panel, user management, content moderation

### Resident User  
- **Email**: resident@nairobi.gov
- **Password**: resident123
- **Role**: Regular Citizen
- **Access**: Citizen dashboard, submit ideas, comment, vote

## Testing Scenarios

### Admin Testing
1. **Login**: Visit `/users/sign_in`
2. **Admin Panel**: Access `/admin` after login
3. **User Management**: View, edit, toggle admin status for users
4. **Content Moderation**: Approve/reject community ideas and submissions
5. **Audit Trail**: Check admin actions are logged
6. **2FA Setup**: Enable two-factor authentication (optional)

### Resident Testing
1. **Login**: Visit `/users/sign_in`
2. **Dashboard**: Access `/profile` or `/user/dashboard`
3. **Community Ideas**: Browse, create, and vote on ideas
4. **Comments**: Add comments to existing ideas
5. **Profile**: Edit personal information

## Key Features to Test

### Authentication
- ✅ Role-based access control
- ✅ Session timeout (30 minutes)
- ✅ Admin action logging
- ✅ Two-factor authentication (admin only)

### Navigation
- Admin: `/admin` → full admin interface
- Resident: `/profile` → citizen dashboard
- Public: `/` → landing page

### Security Features
- Admins cannot delete themselves
- Admins cannot modify their own admin status
- All admin actions are logged with IP address
- Residents can only edit their own content

## Development Notes

This is a prototype environment for testing functionality only. Do not use these credentials in production.

To reset test data: `rails db:seed`