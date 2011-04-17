# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def edit_image
    image_tag("/images/edit.png",:alt=>'edit',:title=>'edit')
  end
  def delete_image
    image_tag("/images/delete.png",:alt=>'delete',:title=>'delete')
  end
  def done_image
    image_tag("/images/done.png",:alt=>'done',:title=>'done')
  end
end
