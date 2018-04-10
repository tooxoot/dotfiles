require 'rest-client'
require 'json'
require 'pp'

GROUP_ID = 61

# response = RestClient.get 'https://git.uni-due.de/api/v4/projects', {'PRIVATE-TOKEN': 'f2HUeQy7P6aB4RnRaFWK'}
# response = RestClient.get 'https://git.uni-due.de/api/v4/groups/61/projects', {'PRIVATE-TOKEN': 'f2HUeQy7P6aB4RnRaFWK'}
# response = RestClient.get 'https://git.uni-due.de/api/v4/groups/sep/test', {'PRIVATE-TOKEN': 'f2HUeQy7P6aB4RnRaFWK'}
response = RestClient.get 'https://git.uni-due.de/api/v4/users', {'PRIVATE-TOKEN': 'f2HUeQy7P6aB4RnRaFWK'}
# response = RestClient.get 'https://git.uni-due.de/api/v4/groups?all_available=true', {'PRIVATE-TOKEN': 'f2HUeQy7P6aB4RnRaFWK'}
results = JSON.parse(response)
# results.each { |result|
#   result.select! { |k,v| ['name', 'path_with_namespace', 'id', 'full_path'].include?(k)}
# }
pp results


# curl --request GET --header "PRIVATE-TOKEN: f2HUeQy7P6aB4RnRaFWK" "https://git.uni-due.de/api/v4/users"
