debot_address=`tonos-cli genaddr QuizDebot.tvc QuizDebot.abi.json --genkey debot.keys.json | grep 'Raw address' | awk '{print $NF}'`
echo $debot_address

./tonos-cli call 0:841288ed3b55d9cdafa806807f02a0ae0c169aa5edfe88a789a6482429756a94 sendGrams "{\"dest\":\"$debot_address\",\"amount\":\"1000000000\"}" --abi giver.abi.json

./tonos-cli deploy QuizDebot.tvc '{"options":0,"debotAbi":"","targetAddr":"0:0000000000000000000000000000000000000000000000000000000000000000","targetAbi":""}' --sign debot.keys.json --abi QuizDebot.abi.json

./tonos-cli debot fetch $debot_address