function Show-All-Instances {
    [CmdletBinding(PositionalBinding=$false)]
    param(
        [Parameter(Mandatory=$false,
        HelpMessage="Enter filter parameters in the form key=value, key=value, ...")]
        [ValidatePattern(".+=.+")]
        [AllowEmptyCollection()]
        [array]$filters,

        [Parameter(Mandatory=$false,
        HelpMessage="Enter query parameters in the form value, value, ...")]
        [ValidatePattern("[a-zA-Z0-9]+")]
        [AllowEmptyCollection()]
        [array]$queries
    )

    $command = "aws ec2 describe-instances"

    if ($filters) {
        $filter_string = ""
        foreach ($filter in $filters)
        {
            $key, $value = $filter -split "="
            $filter_string += [string]::Format("Name={0},Values={1} ", $key, $value)
        }
        $command += " --filter $filter_string"
    }

    if ($queries) {
        $queries = $queries -join ","
        $command += " --query Reservations[*].Instances[*].[$queries]"
    }

    Write-Output( $command )
    Invoke-Expression -Command "$command --output text" | Out-String -OutVariable output | Out-Null
    return $output
}

function Start-All-Instances {
    param(
        [parameter(ValueFromPipeline)]
        [string]$ids
    )
    $ids = $ids -Split [Environment]::NewLine -join " "
    Invoke-Expression -Command "aws ec2 start-instances --instance-ids $ids"
}

function Stop-All-Instances {
    param(
        [parameter(ValueFromPipeline)]
        [string]$ids
    )
    $ids = $ids -Split [Environment]::NewLine -join " "
    Invoke-Expression -Command "aws ec2 stop-instances --instance-ids $ids"
}

function Show-EC2-InstanceIds {
    Show-All-Instances -filters tag:Name=nick-* -queries InstanceId
}; Set-Alias My-Instances Show-EC2-InstanceIds

function Show-EC2-States {
    Show-All-Instances -filters tag:Name=nick-* -queries InstanceId,State.Name
}; Set-Alias My-Instance-States Show-EC2-States

Export-ModuleMember -Function * -Alias *
