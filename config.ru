class App
  def call(env)
    ap(env)
    [200,{'Content-Type'=>"text/html"},["Hi class!"]]
  end
end

run App.new
