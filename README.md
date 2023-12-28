# A PID controller for PWM devices

pwmpid is a PID controller written in POSIX shell for PWM hardware exposed by
the Linux PWM API.

Features:

* POSIX shell script with effectively no dependcies.
* Anything that's a file containing a numerical value can be an input.
* Adjustable moving average of input values.
* Clamps on the integral error.
* Minimum duty cycle for starting mechanical consumers of the PWM output.
* No config verification or safety checks whats-o-ever.


## Installation

Executing `make install` as root will install pwmpid and its service file into
the default locations, `make uninstall` will remove them again.


## Configuration

Configuration files are located under `/etc/pwmpid` and follow the naming scheme
`*chip*-*channel*.conf`.
For example a configuration file used for controlling
`/sys/class/pwm/pwmchip0/pwm0` would be `/etc/pwmpid/pwmchip0-pwm0.conf`.

The file `pwmpid.conf.default` is an example configuration file reflecting all
the default values for pwmpid.
All settings are optional; only values that need adjusting have to be specified
in the actual configuration file -- which is probably most of them.


## Usage

### Running pwmpid manually

Running pwmpid manually can be especially useful for parameter tuning.
Debug output for internal variables of the controller can be enabled by setting
`DEBUG=1` in the configuration file.

```sh
pwmpid pwchip0-pwm0
```

### Running pwmpid as a systemd service

The service template in this repository allows systemd to control multiple
instances with the chip/cannel path as systemd-escaped instances name.

```sh
systemctl enable --now pwmpid@pwchip0-pwm0.service
```
