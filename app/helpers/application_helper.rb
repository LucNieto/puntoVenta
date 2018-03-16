module ApplicationHelper
  def money_format( number )
    "$#{number_with_delimiter( number, delimiter: "," )}"
  end
end
