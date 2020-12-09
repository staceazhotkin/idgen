NHS_API_BASEURL=http://danielbayley.uk/nhs-number/api/NhsNumbers
nhs()
{
# usage example: nhs 000 000 0000
# usage example: nhs 0000000000
# usage example: nhs

	if [[ $# -ne 0 ]]; 
		then 
			NHS_TO_VALIDATE=$(echo ${@} | tr -cd [0-9]);
			[[ -z "$NHS_TO_VALIDATE" ]] && return 1;
			echo $(curl -sS "${NHS_API_BASEURL}/ValidateNhsNumber/$(echo ${@} | tr -cd [0-9])")
		else 
			echo $(curl -sS "${NHS_API_BASEURL}/GetNhsNumbers/")
		fi
}