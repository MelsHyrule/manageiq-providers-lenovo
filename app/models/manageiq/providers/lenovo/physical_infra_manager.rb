class ManageIQ::Providers::Lenovo::PhysicalInfraManager < ManageIQ::Providers::PhysicalInfraManager
  include ManageIQ::Providers::Lenovo::ManagerMixin
  include_concern 'Operations'

  require_nested :Refresher
  require_nested :RefreshParser
  require_nested :EventCatcher
  require_nested :EventParser
  require_nested :Parser
  require_nested :RefreshWorker

  def self.ems_type
    @ems_type ||= "lenovo_ph_infra".freeze
  end

  def self.description
    @description ||= "Lenovo XClarity"
  end

  def hostname_ipaddress?(hostname)
    IPAddr.new(hostname)
    return true
  rescue
    return false
  end
end
