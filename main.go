package main

import (
	_ "embed"
	"fmt"
	"os"

	"github.com/d2jvkpn/socks5-proxy/bin"

	"github.com/d2jvkpn/gotk"
	"github.com/spf13/viper"
)

var (
	//go:embed project.yaml
	_Project []byte

	//go:embed deployments/docker_deploy.yaml
	_Depoyment []byte
)

func main() {
	var (
		err     error
		project *viper.Viper
		command *gotk.Command
	)

	if project, err = gotk.ProjectFromBytes(_Project); err != nil {
		fmt.Fprintf(os.Stderr, "load project: %s\n", err)
		os.Exit(1)
	}

	command = gotk.NewCommand(project.GetString("app_name"))
	command.Project = project

	command.AddCmd(
		"config", "show config(ssh_proxy, socks5_proxy, proxy_pac, deployment)",
		func(args []string) {
			errMsg := "Subcommand is required: ssh_proxy | socks5_proxy | proxy_pac | deployment\n"

			if len(args) == 0 {
				fmt.Fprintf(os.Stderr, errMsg)
				os.Exit(1)
				return
			}

			switch args[0] {
			case "ssh_proxy", "socks5_proxy", "proxy_pac":
				fmt.Printf("%s\n", command.Project.GetString(args[0]))
			case "deployment":
				fmt.Printf("%s\n", _Depoyment)
			default:
				fmt.Fprintf(os.Stderr, errMsg)
				os.Exit(1)
			}
		},
	)

	command.AddCmd(
		"ssh", "socks5 proxy through ssh",
		bin.RunSSHProxy,
	)

	command.AddCmd(
		"test", "test socks5 proxy",
		bin.TestProxy,
	)

	command.Execute(os.Args[1:])
}
