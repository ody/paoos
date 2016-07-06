Puppet::Type.newtype :database, :is_capability => true do
  newparam :name, :is_namevar => true
  newparam :user
  newparam :password
  newparam :database
  newparam :host
end
