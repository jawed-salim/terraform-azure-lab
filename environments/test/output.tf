output "linux_virtual_machine_ids" {
  description = "The resource id's of all Linux Virtual Machine."
  value       = module.virtual-machine.linux_virtual_machine_ids
}

output "linux_vm_password" {
  description = "Password for the Linux VM"
  sensitive   = true
  value       = module.virtual-machine.linux_vm_password
}

output "linux_vm_public_ips" {
  description = "Public IP's map for the all windows Virtual Machines"
  value       = module.virtual-machine.linux_vm_public_ips
}

output "linux_vm_private_ips" {
  description = "Public IP's map for the all windows Virtual Machines"
  value       = module.virtual-machine.linux_vm_private_ips
}

output "network_security_group_ids" {
  description = "List of Network security groups and ids"
  value       = module.virtual-machine.network_security_group_ids
}