external_url 'https://gitlab.jkantech.com'
gitlab_rails['initial_root_password'] = ""
letsencrypt['contact_emails'] = ['admin@example.com'] # Optional

gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.example.net"
gitlab_rails['smtp_port'] = 587
gitlab_rails['smtp_user_name'] = "gitlab@example.com"
gitlab_rails['smtp_password'] = ""
gitlab_rails['smtp_domain'] = "example.com"
gitlab_rails['smtp_authentication'] = "login"
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_tls'] = false
gitlab_rails['smtp_openssl_verify_mode'] = 'peer'

# If your SMTP server does not like the default 'From: gitlab@localhost' you
# can change the 'From' with this setting.
gitlab_rails['gitlab_email_from'] = 'noreply@example.com'
gitlab_rails['gitlab_email_reply_to'] = 'gitlab@example.com'
gitlab_rails['gitlab_email_display_name'] = 'jkanTech Gitlab'

gitlab_rails['backup_upload_connection'] = {
  'provider' => 'AWS',
  'aws_access_key_id' => '',
  'aws_secret_access_key' => '',
  'endpoint' => 'https://',
  'path_style' => true
}
gitlab_rails['backup_upload_remote_directory'] = 'gitlab'
gitlab_rails['backup_keep_time'] = 60
#gitlab_rails['backup_keep_time'] = 604800

### GitLab uploads
###! Docs: https://docs.gitlab.com/ee/administration/uploads.html
#gitlab_rails['uploads_object_store_enabled'] = true
#gitlab_rails['uploads_object_store_remote_directory'] = "gitlab-uploads"
#gitlab_rails['uploads_object_store_connection'] = {
#  'provider' => 'AWS',
#  'aws_access_key_id' => '',
#  'aws_secret_access_key' => '',
#  'endpoint' => 'https://eu2.contabostorage.com',
#   'path_style' => true # Use 'host/bucket_name/object' instead of 'bucket_name.host/object'
#}