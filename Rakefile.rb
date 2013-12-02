task :default => :run_tests

task :run_tests do
  system("rspec test/")
end
