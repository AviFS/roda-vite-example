require 'roda'

class App < Roda

  plugin :render
  plugin :vite

  plugin :public

  route do |r|
    r.public
    r.root do
      view 'index'
    end
  end
end
