class PagePolicy < Struct.new(:user, :page)
  def home?
    true
  end
end

