with open("test_qpsk.txt") as lines:
	result = "qpsk = ["
	for line in lines:
		data = line[:-1].split(',')
		result += str(data[1])
		result += ' '
print(result+"];")

with open("test_8_qam.txt") as lines:
	result = "qam8 = ["
	for line in lines:
		data = line[:-1].split(',')
		result += str(data[1])
		result += ' '
print(result+"];")

with open("test_16_qam.txt") as lines:
	result = "qam16 = ["
	for line in lines:
		data = line[:-1].split(',')
		result += str(data[1])
		result += ' '
print(result+"];")

with open("test_16_qam_refine.txt") as lines:
	result = "qam16_refine = ["
	for line in lines:
		data = line[:-1].split(',')
		result += str(data[1])
		result += ' '
print(result+"];")