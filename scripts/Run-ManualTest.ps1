function Get-Request($uri) {
    $response = Send-Request "GET" $uri

    Write-Host $response.RawContent
    
    $responseJson = ConvertFrom-Json $response.Content
    $responseJson.Id
    return $responseJson
}

function Patch-Request($uri, $body) {
    Send-Request "PATCH" $uri $body
}

function Post-Request($uri, $body) {
    Send-Request "POST" $uri $body
}

function Delete-Request($uri) {
    Send-Request "DELETE" $uri
}

function Send-Request($method, $uri, $body) {
    Write-Host "$method $uri" -ForegroundColor Cyan
    
    if ($body -ne $null) {
        Write-Host $body -ForegroundColor Yellow
    }

    try {
        if ($method -eq "GET" -or $method -eq "DELETE") {
            $response = Invoke-WebRequest -Method $method -Uri $uri -Headers @{ "Foo" = "Bar" } -ErrorAction:Stop
        }
        else {
            $response = Invoke-WebRequest -Method $method -Uri $uri -Headers @{ "Foo" = "Bar" } -ContentType "application/json;odata.metadata=minimal" -Body $body -ErrorAction:Stop
        }
    }
    catch {
        if ($_.Exception.Response -ne $null) {
            $response = $_.Exception.Response
            $result = $response.GetResponseStream()
            $reader = New-Object System.IO.StreamReader($result)
            $reader.BaseStream.Position = 0
            $reader.DiscardBufferedData()
            $responseBody = $reader.ReadToEnd()
            Write-Host "$([int]$response.StatusCode) $($response.StatusDescription)" -ForegroundColor Magenta
            Write-Host $responseBody -ForegroundColor Magenta
        }
        throw $_
    }

    if ($response.StatusCode -eq 200 -or $response.StatusCode -eq 201) {
        return $response
    }
    else {
        $response.RawContent
        return $null
    }
}

Get-Request http://localhost:19158/Products | Out-Null

$body = @{
    Name = "Foo Bar";
} | ConvertTo-Json -Compress
$response = Post-Request http://localhost:19158/Products $body
Write-Host $response.RawContent
