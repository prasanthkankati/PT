#!/bin/bash
echo "Running JMeter test..."
mkdir -p jmeter-results/html-report
jmeter -n -t PetShop.jmx -l jmeter-results/results.jtl -e -o jmeter-results/html-report
echo "Test execution done!"
