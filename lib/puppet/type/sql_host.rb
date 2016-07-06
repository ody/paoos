Puppet::Type.newtype :sql_host, :is_capability => true do
  newparam :name, :is_namevar => true
  newparam :host
end
