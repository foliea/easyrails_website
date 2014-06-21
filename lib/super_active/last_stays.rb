class LastStaysValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    value_was = record.send("#{attribute}_was")

    # If last record with attribute was equal to true
    # it can't change this attribute value to false
    if value == false && value_was == true &&
      record.class.where("#{attribute}" => true).count <= 1
      record.errors[attribute] << I18n.t('error.validation.last_stays')
    end
  end
end
