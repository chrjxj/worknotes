# -*- coding: utf-8 -*-


#
# 定时任务
#
import sched, time, datetime
s = sched.scheduler(time.time, time.sleep)
def print_time(): print "From print_time", time.time()
print time.time()
tt = (50 + time.mktime(datetime.datetime.now().timetuple()))
s.enterabs(tt, 1, print_time, ())
s.enter(10, 1, print_time, ())
s.run()
print time.time()


#
# Logging
#
import logging

formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')

# first file logger
logger_1 = logging.getLogger('simple_logger')
hdlr_1 = logging.FileHandler('simplefile_1.log')
hdlr_1.setFormatter(formatter)
logger_1.addHandler(hdlr_1)

# second file logger
logger_2 = logging.getLogger('simple_logger_2')
hdlr_2 = logging.FileHandler('simplefile_2.log')
hdlr_2.setFormatter(formatter)
logger_2.addHandler(hdlr_2)

logger_1.info('message 1')
logger_2.error('error foo')


#
# Stats
#

# From http://docs.scipy.org/doc/scipy/reference/tutorial/stats.html
# As an exercise, we can calculate our ttest also directly without using the provided function, which should give us the same answer, and so it does:
tt = (sm - m) / np.sqrt(sv / float(n))  # t-statistic for mean
pval = stats.t.sf(np.abs(tt), n - 1) * 2  # two-sided pvalue = Prob(abs(t)>tt)
print 't-statistic = %6.3f pvalue = %6.4f' % (tt, pval)
t - statistic = 0.391
pvalue = 0.6955

from scipy import stats
# Studnt, n=999, p<0.05, 2-tail
# equivalent to Excel TINV(0.05,999)
print stats.t.ppf(1 - 0.025, 999)

# Studnt, n=999, p<0.05%, Single tail
# equivalent to Excel TINV(2*0.05,999)
print stats.t.ppf(1 - 0.05, 999)
