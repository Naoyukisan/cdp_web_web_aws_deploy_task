# lib/capistrano/tasks/env.rake
namespace :env do
  desc "Show AWS env on remote"
  task :show do
    on roles(:app) do
      within current_path do
        with fetch(:default_env) do
          execute :bash, "-lc", %q{printenv AWS_ACCESS_KEY_ID AWS_REGION S3_BUCKET | sed -n '1,200p'}
        end
      end
    end
  end
end
