# Root folders
New-Item -ItemType Directory -Path "src\Frontend\ReactApp\public" -Force
New-Item -ItemType Directory -Path "src\Frontend\ReactApp\src" -Force

# Frontend files
New-Item -ItemType File -Path "src\Frontend\ReactApp\.env.development" -Force
New-Item -ItemType File -Path "src\Frontend\ReactApp\.env.production" -Force
New-Item -ItemType File -Path "src\Frontend\ReactApp\package.json" -Force
New-Item -ItemType File -Path "src\Frontend\ReactApp\tsconfig.json" -Force

# Backend Services
$services = @("CustomerService", "CardService")
$layers = @("API", "Application", "Domain", "Infrastructure")

foreach ($service in $services) {
    foreach ($layer in $layers) {
        New-Item -ItemType Directory -Path "src\Backend\Services\$service\$layer" -Force
    }
}

# Shared libraries
$sharedDirs = @("Constants", "Extensions", "Common")
foreach ($dir in $sharedDirs) {
    New-Item -ItemType Directory -Path "src\Backend\Shared\$dir" -Force
}

# API Gateway
New-Item -ItemType Directory -Path "src\Backend\API_Gateway\ApiGateway1" -Force

# Tests
$testDirs = @(
    "tests\CustomerService.UnitTests",
    "tests\CustomerService.IntegrationTests",
    "tests\CardService.UnitTests",
    "tests\CardService.IntegrationTests",
    "tests\ReactApp.Tests"
)
foreach ($dir in $testDirs) {
    New-Item -ItemType Directory -Path $dir -Force
}

# Scripts
New-Item -ItemType Directory -Path "scripts\azure\infrastructure" -Force
New-Item -ItemType Directory -Path "scripts\azure\aks-deployment" -Force
New-Item -ItemType Directory -Path "scripts\azure\observability" -Force

New-Item -ItemType Directory -Path "scripts\docker" -Force
New-Item -ItemType File -Path "scripts\docker\Dockerfile.CustomerService" -Force
New-Item -ItemType File -Path "scripts\docker\Dockerfile.CardService" -Force
New-Item -ItemType File -Path "scripts\docker\Dockerfile.ReactApp" -Force

New-Item -ItemType Directory -Path "scripts\ci-cd" -Force

# Docs
New-Item -ItemType Directory -Path "docs" -Force
New-Item -ItemType File -Path "docs\architecture.md" -Force
New-Item -ItemType File -Path "docs\deployment-guide.md" -Force
New-Item -ItemType File -Path "docs\api-documentation.md" -Force

# Root-level files
New-Item -ItemType File -Path ".gitignore" -Force
New-Item -ItemType File -Path "global.json" -Force

Write-Host "✅ Folder structure created successfully!"
