package main

import (
	"fmt"
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
	"github.com/hashicorp/terraform-plugin-sdk/v2/plugin"
)

func main() {
	fmt.Println("Hello world")
	plugin.Serve(&plugin.ServeOpts{
		ProviderFunc: Provider,
	})
}

// in go title case would be exported
func Provider() *schema.Provider {
	var p *schema.Provider

	p = &schema.Provider{
		ResourcesMap:   map[string]*schema.Resource{},
		DataSourcesMap: map[string]*schema.Resource{},
		Schema: map[string]*schema.Schema{
			"endpoint": {
				Type:        schema.TypeString,
				Required:    true,
				Description: "The API endpoint",
			},
			"token": {
				Type:        schema.TypeString,
				Sensitive:   true,
				Required:    true,
				Description: "Bearer token from TerraTown.cloud ",
			},
			"user_uuid": {
				Type:        schema.TypeString,
				Required:    true,
				Description: "ExamPro user uuid",
				//ValidateFunc: validateUUID(),
			},
		},
	}
	//p.ConfigureContextFunc = providerConfigure(p)
	return p
}

//
//func validateUUID(v interface{}, k string) ([]string, []error) {
//	log.Print("validateUUID: " + k)
//
//	value := v.(string)
//
//	if _, err = uuid.ParseUUID(value); err != nil {
//		errors = append(
//			error,
//			fmt.Errorf("invalid UUID format"),
//		)
//	}
//	return
//}

func providerConfigure(*schema.Provider) schema.ConfigureContextFunc {

	return nil
}
