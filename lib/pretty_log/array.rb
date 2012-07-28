class Array
  def pretty_log(columns = nil)
     self.collect {|e| e.pretty_log(columns)}
  end
end
