module ApplicationHelper
  def pluralize_without_count(count, noun, text = nil)
    if count != 0
      count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
    end
  end

  def truncate(string, number_of_caracter)
    if number_of_caracter < string.length
      string.first(number_of_caracter) + "..."
    else
      string
    end
  end
end
