module ApplicationHelper


  def user_has_profile?(user = current_user)
    return false unless user.present?
    Profile.where(user_id: user.try(:id) || user).exists?
  end

 
  def duration(booking)
  return (booking.end_date - booking.start_date).to_i
  end

  def total_fee(booking)
    return duration(booking) * Item.find(booking.item_id).price
  end

  

end
