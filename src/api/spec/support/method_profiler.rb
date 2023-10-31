RSpec.configure do |config|
  method_profiler = nil
  method_profiler2 = nil
  config.before(:suite) do
    method_profiler = MethodProfiler.observe(Configuration)
    method_profiler2 = MethodProfiler.observe(ActiveRecord::FinderMethods)
  end

  config.after(:suite) do
    puts method_profiler.report.sort_by(:total_calls)
    puts method_profiler2.report.sort_by(:total_calls)
  end
end
