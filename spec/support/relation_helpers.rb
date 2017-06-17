module RelationHelpers
  def stub_relation(model_instance, relation_name)
    mock_instance = double(:instance, save: true)
    mock_relation = double(:relation, new: mock_instance)
    allow(model_instance).to receive(relation_name).and_return(mock_relation)

    mock_instance
  end
end

RSpec.configure do |config|
  config.include RelationHelpers, type: :controller
end
