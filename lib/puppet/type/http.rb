Puppet::Type.newtype :http, :is_capability => true do
  newparam :name, :is_namevar => ture
  newparam :hostname
  newparam :port
  newparam :ip
end
