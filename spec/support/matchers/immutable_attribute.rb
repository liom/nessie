RSpec::Matchers.define :have_immutable_field do |attribute, value|
  match do |model|
    model.send("#{attribute}=", Object.new)
    model.send(attribute) == value
  end
end
