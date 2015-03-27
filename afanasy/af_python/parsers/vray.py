from parsers import parser

import re

re_frame = re.compile(
	r'SCEN.*(progr: begin scene preprocessing for frame )([0-9]+)'
)
re_number = re.compile(r'[0-9]+')
re_percent = re.compile(
	r'Rendering image...:([ ]{,})([0-9]{1,2}.*)(%[ ]{,}).*'
)


class vray(parser.parser):
	"""VRay Standalone
	"""

	def __init__(self):
		parser.parser.__init__(self)
		self.buffer = ""
		self.numinseq = 0

	def do(self, data, mode):
		"""Missing DocString

		:param data:
		:param mode:
		:return:
		"""
		# self.buffer += data
		# needcalc = False
		# frame = False

		if len(data) < 1:
			return

		match = re_percent.findall(data)
		if len(match):
			percentframe = float(match[-1][1])
			self.percent = int(percentframe)
