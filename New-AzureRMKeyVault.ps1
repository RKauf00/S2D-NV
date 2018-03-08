
$Params=
@{

    AzEnvironment    =    '{environment}'         #AzureCloud <--OR--> AzureUSGovernment' 
    Region           =    '{region}'              #South Central US, USGov Texas, etc.
    vaultName        =    '{unique-vault-name}'
    password         =    '{password-value}'
    Group            =    '{resource-group}'
    Secret           =    '{secret-value}'

}

Login-AzureRmAccount -Environment $Params.AzEnvironment

New-AzureRmResourceGroup -Name $Params.Group -Location $Params.Region

New-AzureRmKeyVault `
  -VaultName $Params.vaultName `
  -ResourceGroupName $Params.Group `
  -Location $Params.Region `
  -EnabledForTemplateDeployment

$secretValue = ConvertTo-SecureString $Params.Password -AsPlainText -Force

Set-AzureKeyVaultSecret -VaultName $Params.vaultname -Name $Params.Secret -SecretValue $secretValue
