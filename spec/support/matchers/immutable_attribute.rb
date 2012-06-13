RSpec::Matchers.define :have_immutable_field do |attribute, value|
  match do |model|
    # expect { model.send("#{attribute}=", Object.new) }.not_to change{model.send(attribute)}

    model.send(attribute).should == value
    model.attributes[attribute] = Object.new
    model.send(attribute).should == value
  end
end
