module StudentsHelper
  def format_date(date)
    return '' if date.nil?

    date.strftime('%d %^b, %Y')
  end

  def formatted_student_name(student)
    return '' if student.nil?
    "#{student.first_name} #{student.last_name}".titleize
  end

  def formatted_address(student)
    return '' if student.nil?
    "#{student.city}, #{student.state}, #{student.country}"
  end
end
