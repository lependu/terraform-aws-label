package test

import (
  "testing"

  "github.com/gruntwork-io/terratest/modules/terraform"
  "github.com/stretchr/testify/assert"
)

// Test the Terraform module in examples/complete using Terratest.
func TestExamplesComplete(t *testing.T) {
  t.Parallel()

  terraformOptions := &terraform.Options{
    // The path to where our Terraform code is located
    TerraformDir: "../example",
    VarFiles: []string{"fixtures.auto.tfvars"},
  }

  // At the end of the test, run `terraform destroy` to clean up any resources that were created
  // defer terraform.Destroy(t, terraformOptions)

  terraform.InitAndApply(t, terraformOptions)

  serviceName := terraform.Output(t, terraformOptions, "label")

  assert.Equal(t, "terraform_test_label", serviceName)

  tags := terraform.OutputMap(t, terraformOptions, "tags")

  assert.Equal(t, "London", tags["City"])
  assert.Equal(t, "terraform_test_label", tags["Name"])
  assert.Equal(t, "admin@terraform", tags["ManagedBy"])
  assert.Equal(t, "terraform", tags["Namespace"])
  assert.Equal(t, "test", tags["Stage"])
}
