require 'spec_helper'

describe Document do
  it { should have_attached_file(:document) }
  it { should validate_attachment_presence(:document) }

  it do
    should validate_attachment_content_type(:document).
      allowing('application/pdf', 'application/msword').
      rejecting('text/plain', 'text/xml')
  end

  it do
  #  should validate_attachment_size(:document).
  #    less_than(20.megabytes)
  end
end
