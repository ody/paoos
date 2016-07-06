Puppet::Type.newtype :amqp, :is_capability => true do
  newparam :name, :is_namevar => true
  newparam :user
  newparam :password
  newparam :virtual_host
  newparam :host
  newparam :port
end
