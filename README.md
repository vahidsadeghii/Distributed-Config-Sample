# Distributed Config Sample

If you have experience on running multi-instance of service specially at microservice architecture, you may have distributed config problem. Means how to handle configurations that when a property changes all instances effected.

I'm going to provide a solution on Spring stack.

The spring has a module, Spring Cloud Config, that can be used to distribute config changes cross all instances. Spring cloud config can be integrated with git repository or storage in order to track config changes and provided for other services.

If we make different between infrastructure config and business config i thinkn its not best practice to user spring cloud config for business configs and it can be best fit for infrastructure configs.

## Infrastructue config
A configuration that takes effect on servies dirclty, eg. changing token expiration time. This configuration managed by DevOPS or developers.

## Business Config
Configurations that make change on business logs of services, example maximum transfer amount on fund transfer system. These configurations managed by business manager or business development or support team.

In this example I'm going to provide a sample in order to manage business distributed configs.

## Dependencies
- Spring Boot 2.x
- Spring Data JPA
- Etcd
- Flyway
- H2Database
- Lombok
- Apache Commons

## How it Works
When application start at first time it generate GLOBAL_CONFIGURATION table in h2 database with 2 records

By calling otp generator api, you get a random otp:
  > curl --location --request POST 'localhost:8080/otp'

In order to change otp length dynamically:
  > etcdctl --endpoints=192.168.0.107:2379 put /sample/OTP_LEN 7

You can find more about etcdctl options, [here](https://etcd.io/docs/v3.4.0/dev-guide/interacting_v3/)