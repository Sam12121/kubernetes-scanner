module github.com/Sam12121/kubernetes-scanner/cmd/v2

go 1.20

replace github.com/Sam12121/kubernetes-scanner/v2 => ../

require (
	github.com/Sam12121/kubernetes-scanner/v2 v2.0.0-00010101000000-000000000000
	github.com/sirupsen/logrus v1.9.3
)

require golang.org/x/sys v0.0.0-20220715151400-c0bba94af5f8 // indirect
