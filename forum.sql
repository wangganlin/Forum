/*
MySQL Data Transfer
Source Host: localhost
Source Database: forum
Target Host: localhost
Target Database: forum
Date: 2016/7/13 18:46:31
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for lt_comment
-- ----------------------------
CREATE TABLE `lt_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cDate` varchar(20) DEFAULT NULL,
  `cContent` varchar(1000) DEFAULT NULL,
  `cUsername` varchar(20) DEFAULT NULL,
  `cTieId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for lt_huifu
-- ----------------------------
CREATE TABLE `lt_huifu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hDate` varchar(20) DEFAULT NULL,
  `hContent` varchar(1000) DEFAULT NULL,
  `cUsername` varchar(20) DEFAULT NULL,
  `hUsername` varchar(20) DEFAULT NULL,
  `hcomID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for lt_tie
-- ----------------------------
CREATE TABLE `lt_tie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tTitle` varchar(100) DEFAULT NULL,
  `tDate` varchar(20) DEFAULT NULL,
  `tType` varchar(100) DEFAULT NULL,
  `tContent` varchar(10000) DEFAULT NULL,
  `tStyle` varchar(100) DEFAULT NULL,
  `tUsername` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for lt_user
-- ----------------------------
CREATE TABLE `lt_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uName` varchar(20) DEFAULT NULL,
  `uPwd` varchar(20) DEFAULT NULL,
  `uPhoto` varchar(100) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `tNum` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `lt_comment` VALUES ('20', '2016-07-12 19:25:48', '写的不错哦', '罗梦霞', '41');
INSERT INTO `lt_comment` VALUES ('21', '2016-07-13 18:43:15', '有的用过，哈哈', '罗梦霞', '35');
INSERT INTO `lt_tie` VALUES ('25', 'java简介——初学java的都进来看看', '2016-07-12 18:24:54', 'normal', '   Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程。\r\n   Java具有简单性、面向对象、分布式、健壮性、安全性、平台独立与可移植性、多线程、动态性等特点。Java可以编写桌面应用程序、Web应用程序、分布式系统和嵌入式系统应用程序等。\r\n   JDK是整个Java的核心，包括了Java运行环境（Java Runtime Envirnment），一些Java工具和Java的核心类库（Java API）。另外，可以把Java API类库中的Java SE API子集和Java虚拟机这两部分统称为JRE（JAVA Runtime Environment），JRE是支持Java程序运行的标准环境。\r\n   ', 'java', '罗梦霞');
INSERT INTO `lt_tie` VALUES ('26', 'java基础知识（1）', '2016-07-12 18:46:55', 'better', '\r\n在Java语言中，标识符是以字母、下划线(…)或美元符($)开头，由字母、数字、下划线(一)或美元符($)组成的字符串。标识符区分大小写，长度没有限制。除以上所列几项之外，标识符中不能含有其他符号，当然也不允许插入空格。在程序中，标识符可用作变量名、方法名、接口名、类名等。Java变量类型：\r\n\r\n　　① 基本类型：boolean,byte,char,shot,int,long,float,double\r\n\r\n　　② 引用类型：所有类、接口、数组、枚举、标注\r\n实际上，Java源代码使用的是Unicode码，而不是ASCII码。Unicode码用16位表示一个字符，因此，Unicode字符集中的字符数可达65535个，比通常使用的ASCII码字符集大得多。\r\n     Unicode兼容了许多不同的字母表，包括常见语种的字母。英文字母、数字和标点符号在Unicode和ASCII字符集中有相同的值。·\r\n     标识符内可以包含关键字，但不能与关键字完全一样。如“thisOne”是一个合法的标识符，但“this”是关键字，不能当作标识符。', 'java', '罗梦霞');
INSERT INTO `lt_tie` VALUES ('27', '你不得不看的java', '2016-07-12 18:53:00', 'normal', '和String相关的一些事儿\r\n\r\n　　首先，我们聊一聊Java中堆和栈的事儿。\r\n\r\n    栈：存放基本类型，包括char/byte/short/int/long/float/double/boolean\r\n    堆：存放引用类型，同时一般会在栈中保留一个指向它的指针，垃圾回收判断一个对象是否可以回收，就是判断栈中是否有指针指向堆中的对象。\r\n\r\n　　String作为一种特殊的数据类型，它不完全等同于基本类型，也不是全部的引用类型，许多面试题都有它的身影。\r\n　　String类型变量的存储结构\r\n\r\n　　String的存储结构分为两部分，我们以String a = \"abc\";为例，描述String类型的存储方式：\r\n\r\n　　1）在栈中创建一个char数组，值分为是\'a\'，\'b\'，\'c\'。\r\n\r\n　　2）在堆中创建一个String对象。', 'java', '王甘林');
INSERT INTO `lt_tie` VALUES ('28', '重要事情说三遍！C++入门，C++入门，C++入门', '2016-07-12 18:55:44', 'better', 'C++是在C语言的基础上开发的一种面向对象编程语言，应用广泛；C++支持多种编程范式 －－面向对象编程、泛型编程和过程化编程。最新正式标准C++于2014年8月18日公布。 其编程领域众广，常用于系统开发，引擎开发等应用领域，是至今为止最受广大程序员受用的最强大编程语言之一,支持类：封装、继承、多态等特性!', 'c++', '王甘林');
INSERT INTO `lt_tie` VALUES ('29', 'c++与c语言的关系', '2016-07-12 18:57:07', 'normal', 'C语言是C++的基础，C++和C语言在很多方面是兼容的。\r\nC语言是一个结构化语言，它的重点在于算法与数据结构。C程序的设计首要考虑的是如何通过一个过程，对输入（或环境条件）进行运算处理得到输出（或实现过程（事物）控制）。C++，首要考虑的是如何构造一个对象模型，让这个模型能够契合与之对应的问题域，这样就可以通过获取对象的状态信息得到输出或实现过程（事物）控制。所以C语言和C++的最大区别在于它们解决问题的思想方法不一样。', 'c++', '王甘林');
INSERT INTO `lt_tie` VALUES ('30', '想要学js的过来啦', '2016-07-12 18:59:18', 'normal', 'JavaScript一种直译式脚本语言，是一种动态类型、弱类型、基于原型的语言，内置支持类型。它的解释器被称为JavaScript引擎，为浏览器的一部分，广泛用于客户端的脚本语言，最早是在HTML（标准通用标记语言下的一个应用）网页上使用，用来给HTML网页增加动态功能。\r\n    是一种解释性脚本语言（代码不进行预编译）。\r\n    主要用来向HTML（标准通用标记语言下的一个应用）页面添加交互行为。\r\n    可以直接嵌入HTML页面，但写成单独的js文件有利于结构和行为的分离。\r\n    跨平台特性，在绝大多数浏览器的支持下，可以在多种平台下运行（如Windows、Linux、Mac、Android、iOS等）。\r\n', 'js', '徐冬冬');
INSERT INTO `lt_tie` VALUES ('31', '让我悄悄告诉你——C++语言的优点', '2016-07-12 19:01:36', 'better', ' C++设计成静态类型、和C同样高效且可移植的多用途程序设计语言。\r\n C++设计直接的和广泛的支持多种程序设计风格（程序化程序设计、资料抽象化、面向对象程序设计、泛型程序设计）\r\n C++设计无需复杂的程序设计环境。\r\nC++语言灵活，运算符的数据结构丰富、具有结构化控制语句、程序执行效率高，而且同时具有高级语言与汇编语言的优点，与其它语言相比 ，可以直接访问物理地址，与汇编语言相比又具有良好的可读性和可移植性。', 'c++', '徐冬冬');
INSERT INTO `lt_tie` VALUES ('32', '跟我初识C#', '2016-07-12 19:03:07', 'normal', 'C#是微软公司发布的一种面向对象的、运行于.NET Framework之上的高级程序设计语言。并定于在微软职业开发者论坛(PDC)上登台亮相。C#是微软公司研究员Anders Hejlsberg的最新成果。C#看起来与Java有着惊人的相似；它包括了诸如单一继承、接口、与Java几乎同样的语法和编译成中间代码再运行的过程。但是C#与Java有着明显的不同，它借鉴了Delphi的一个特点，与COM（组件对象模型）是直接集成的，而且它是微软公司 .NET windows网络框架的主角', 'c#', '小爷神坑');
INSERT INTO `lt_tie` VALUES ('33', 'js日常用途', '2016-07-12 19:04:00', 'better', '    嵌入动态文本于HTML页面。\r\n    对浏览器事件做出响应。\r\n    读写HTML元素。\r\n    在数据被提交到服务器之前验证数据。\r\n    检测访客的浏览器信息。\r\n    控制cookies，包括创建和修改等。\r\n    基于Node.js技术进行服务器端编程。 \r\n', 'c#', '小爷神坑');
INSERT INTO `lt_tie` VALUES ('34', '我认识的C#', '2016-07-12 19:05:56', 'normal', 'C#是一种安全的、稳定的、简单的、优雅的，由C和C++衍生出来的面向对象的编程语言。它在继承C和C++强大功能的同时去掉了一些它们的复杂特性（例如没有宏以及不允许多重继承）。C#综合了VB简单的可视化操作和C++的高运行效率，以其强大的操作能力、优雅的语法风格、创新的语言特性和便捷的面向组件编程的支持成为.NET开发的首选语言。', 'c#', '鲁松');
INSERT INTO `lt_tie` VALUES ('35', '你用过这些java开发工具吗', '2016-07-12 19:07:29', 'better', 'Eclipse：一个开放源代码的、基于Java的可扩展开发平台。\r\nNetBeans：开放源码的Java集成开发环境，适用于各种客户机和Web应用。\r\nIntelliJ IDEA：在代码自动提示、代码分析等方面的具有很好的功能。 \r\nMyEclipse：由Genuitec公司开发的一款商业化软件，是应用比较广泛的Java应用程序集成开发环境 。\r\nEditPlus：如果正确配置Java的编译器“Javac”以及解释器“Java”后，可直接使用EditPlus编译执行Java程序。\r\n', 'java', '鲁松');
INSERT INTO `lt_tie` VALUES ('36', '你知道C++的这些缺点吗', '2016-07-12 19:08:52', 'better', 'C++由于语言本身复杂。C++的编译系统受到C++的复杂性的影响，非常难于编写，即使能够使用的编译器如果存在问题，可能难于被发现。\r\n由于本身的复杂性，复杂的C++程序的正确性相当难于保证。\r\nC++对于安全性也无法保证，所以，很容易依靠C++编译出病毒来。', 'c++', '李玉明');
INSERT INTO `lt_tie` VALUES ('37', 'js的特性', '2016-07-12 19:10:44', 'normal', '(1)脚本语言(2)基于对象(3)简单(4)动态性5)跨平台性。不同于服务器端脚本语言，例如PHP与ASP，JavaScript主要被作为客户端脚本语言在用户的浏览器上运行，不需要服务器的支持。所以在早期程序员比较青睐于JavaScript以减少对服务器的负担，而与此同时也带来另一个问题：安全性。而随着服务器的强壮，虽然程序员更喜欢运行于服务端的脚本以保证安全，但JavaScript仍然以其跨平台、容易上手等优势大行其道。同时，有些特殊功能（如AJAX）必须依赖Javascript在客户端进行支持。随着引擎如V8和框架如Node.js的发展，及其事件驱动及异步IO等特性，JavaScript逐渐被用来编写服务器端程序', 'js', '李玉明');
INSERT INTO `lt_tie` VALUES ('38', 'java工作原理的四个方面', '2016-07-12 19:14:30', 'normal', '（1）Java编程语言\r\n（2）Java类文件格式\r\n（3）Java虚拟机\r\n（4）Java应用程序接口', 'java', '陈梦林');
INSERT INTO `lt_tie` VALUES ('39', 'C#的设计目标——值的大家来看哦', '2016-07-12 19:15:15', 'better', 'C#旨在设计成为一种“简单、现代、通用”，以及面向对象的程序设计语言，此种语言的实现，应提供对于以下软件工程要素的支持：强类型检查、数组维度检查、未初始化的变量引用检测、自动垃圾收集（Garbage Collection，指一种自动内存释放技术）。软件必须做到强大、持久，并具有较强的编程生产力。此种语言为在分布式环境中的开发提供适用的组件开发应用。\r\n为使程序员容易迁移到这种语言，源代码的可移植性十分重要，尤其是对于那些已熟悉C和C++的程序员而言。对国际化的支持非常重要。C#适合为独立和嵌入式的系统编写程序，从使用复杂操作系统的大型系统到特定应用的小型系统均适用', 'c#', '陈梦林');
INSERT INTO `lt_tie` VALUES ('40', '很全的知识哦——C++的数据定义', '2016-07-12 19:16:49', 'better', '数据是程序处理的对象，数据可以依其本身的特点进行分类。我们知道在数学中有整数、实数的概念，在日常生活中需要用字符串来表示人的姓名和地址，有些问题的回答只能是“是”或“否”（即逻辑“真”或“假”）。不同类型的数据有不同的处理方法，例如：整数和实数可以参加算术运算，但实数的表示又不同于整数，要保留一定的小数位；字符串可以拼接；逻辑数据可以参加“与”、“或”、“非”等逻辑运算。', 'c++', '李田荣');
INSERT INTO `lt_tie` VALUES ('41', 'js的版本', '2016-07-12 19:18:00', 'better', 'JavaScript已经被Netscape公司提交给ECMA制定为标准，称之为ECMAScript，标准编号ECMA-262。目前最新版为ECMA-262 5th Edition。符合ECMA-262 3rd Edition标准的实现有：\r\n\r\n    Microsoft公司的JScript.\r\n    Mozilla的JavaScript-C（C语言实现），现名SpiderMonkey\r\n    Mozilla的Rhino（Java实现）\r\n    Digital Mars公司的DMDScript\r\n    Google公司的V8\r\n    WebKit\r\n', 'js', '王霞');
INSERT INTO `lt_tie` VALUES ('42', 'C#知识概括(1)', '2016-07-13 17:39:08', 'normal', '两个基本类：一个名叫object的类是所有其他类的基类。而一个名叫string的类也象object一样是这个语言的一部分.作为语言的一部分存在意味着编译器有可能使用它，无论何时在程序中写入一句带引号的字符串，编译器会创建一个string对象来保存它。', 'c#', '王甘林');
INSERT INTO `lt_tie` VALUES ('43', 'java的三种技术架构', '2016-07-13 17:49:55', 'normal', 'JAVAEE：Java Platform Enterprise Edition，开发企业环境下的应用程序，主要针对web程序开发；\r\n\r\nJAVASE：Java Platform Standard Edition，完成桌面应用程序的开发，是其它两者的基础；\r\n\r\nJAVAME：Java Platform Micro Edition，开发电子消费产品和嵌入式设备，如手机中的程序；', 'java', '王甘林');
INSERT INTO `lt_tie` VALUES ('44', 'java和javac命令的区别', '2016-07-13 17:51:50', 'normal', '要知道java是分两部分的：一个是编译，一个是运行。\r\n\r\n    javac：负责的是编译的部分，当执行javac时，会启动java的编译器程序。对指定扩展名的.java文件进行编译。 生成了jvm可以识别的字节码文件。也就是class文件，也就是java的运行程序。\r\n\r\n    java：负责运行的部分.会启动jvm.加载运行时所需的类库,并对class文件进行执行.\r\n\r\n    一个文件要被执行,必须要有一个执行的起始点,这个起始点就是main函数.', 'java', '罗梦霞');
INSERT INTO `lt_tie` VALUES ('45', '变量的作用域和生存期', '2016-07-13 17:52:25', 'normal', '变量的作用域：\r\n\r\n    作用域从变量定义的位置开始，到该变量所在的那对大括号结束；\r\n\r\n生命周期：\r\n\r\n    变量从定义的位置开始就在内存中活了；\r\n\r\n    变量到达它所在的作用域的时候就在内存中消失了；', 'java', '罗梦霞');
INSERT INTO `lt_tie` VALUES ('46', '数据类型', '2016-07-13 17:57:54', 'normal', '1、JavaScript是弱类型语言。可用var m=1;来显示声明。也可m=1；来隐式声明。\r\n\r\n2、命名规则：区分大小写,开头必须是字母或 $ 或 _。abc和ABC为两个不同的变量名。\r\n\r\n3、JavaScript数据类型有三种：基本数据类型（字符串、数值、布尔）、复合数据类型（对象）、特殊数据类型（null、undefined）。', 'js', '罗梦霞');
INSERT INTO `lt_tie` VALUES ('47', '基本数据类型', '2016-07-13 17:58:48', 'normal', '3.1.1 字符串string：例：\'hello world\'; \"hello world\"; \'pony\\\'s \"cat\"\';\r\n\r\n3.1.2 数值number：整型和浮点型\r\n\r\n整型：（1）十进制 例：-10;10;0;（2）以0开头且不含8、9为八进制 例：071; （3）以0x开头为16进制 例：0x7a;\r\n\r\n浮点型：e表示以10为底的指数。例：3.45e2\r\n\r\n特殊数值：\r\n\r\nNaN：特殊的非数字值（唯一的与自身不等的值）\r\nNumber.NaN：特殊的非数字值\r\nNumber.MAX_VALUE：可表示的最大数字\r\nNumber.MIN_VALUE：可表示的最小数字(与零最接近的数字)\r\nNumber.POSITIVE_INFINITY：表示正无穷大的特殊值（显示为infinity）\r\nNumber.NEGATIVE_INFINITY：表示负无穷大的特殊值\r\n\r\n3.1.3 布尔boolean：只有两个值：true、false。', 'js', '罗梦霞');
INSERT INTO `lt_tie` VALUES ('48', 'JSON', '2016-07-13 18:00:17', 'normal', 'JSON建构于两种结构：\r\n\r\n（1）“名称/值”对的集合（A collection of name/value pairs）。不同的语言中，它被理解为对象（object），纪录（record），结构（struct），字典（dictionary），哈希表（hash table），有键列表（keyed list），或者关联数组 （associative array）。\r\n\r\n（2）值的有序列表（An ordered list of values）。在大部分语言中，它被理解为数组（array）。', 'js', '徐冬冬');
INSERT INTO `lt_tie` VALUES ('49', '参数传递', '2016-07-13 18:01:12', 'normal', '方法可以被声明接受可变数目的参数.缺省的参数传递方法是对基本数据类型进行值传递。ref关键字可以用来强迫一个变量通过引用传递，这使得一个变量可以接受一个返回值。out关键字也能声明引用传递过程，与ref不同的地方是，它指明这个参数并不需要初始值。', 'c#', '徐冬冬');
INSERT INTO `lt_tie` VALUES ('50', 'COM的集成', '2016-07-13 18:01:42', 'normal', 'C#对Windows程序最大的卖点可能就是它与COM的无缝集成了，COM就是微软的Win32组件技术.实际上，最终有可能在任何.NET语言里编写COM客户和服务器端。C#编写的类可以子类化一个已存在的COM组件;生成的类也能被作为一个COM组件使用，然后又能使用，比方说，JScript语言子类化它从而得到第三个COM组件。这种现象的结果是导致了一个运行环境的产生，在这个环境里的组件是网络服务，可用任何.NET语言子类化', 'c#', '徐冬冬');
INSERT INTO `lt_tie` VALUES ('51', '代理和反馈', '2016-07-13 18:02:07', 'normal', '一个代理对象包括了访问一个特定对象的特定方法所需的信息.只要把它当成一个聪明的方法指针就行了。代理对象可以被移动到另一个地方，然后可以通过访问它来对已存在的方法进行类型安全的调用.一个反馈方法是代理的特例.event关键字用在将在事件发生的时候被当成代理调用的方法声明中', 'c#', '徐冬冬');
INSERT INTO `lt_tie` VALUES ('52', '数据类型——跟我一起来学习', '2016-07-13 18:03:09', 'normal', '1）：基本数据类型：byte、short、int、long、float、double、char、boolean\r\n\r\n    2）：引用数据类型: 数组、类、接口。\r\n\r\n级别从低到高为：byte,char,short(这三个平级)-->int-->float-->long-->double\r\n\r\n自动类型转换：从低级别到高级别，系统自动转的；\r\n\r\n强制类型转换：什么情况下使用?把一个高级别的数赋给一个别该数的级别低的变量；\r\n\r\n ', 'java', '徐冬冬');
INSERT INTO `lt_tie` VALUES ('53', '如何定义一个函数？', '2016-07-13 18:04:00', 'normal', ' 函数其实就是一个功能，定义函数就是实现功能，通过两个明确来完成：\r\n\r\n    1）、明确该功能的运算完的结果，其实是在明确这个函数的返回值类型。\r\n\r\n    2）、在实现该功能的过程中是否有未知内容参与了运算，其实就是在明确这个函数的参数列表(参数类型&参数个数)。', 'java', '徐冬冬');
INSERT INTO `lt_tie` VALUES ('54', '都来看看，你是不是知道这些？', '2016-07-13 18:06:25', 'normal', '1.函数模板：实际上是建立一个通用函数，其函数类型和参数类型不具体指定，用一个虚拟的类型来代表，这个通用函数就是函数模板2.只有类外定义的成员函数规模很小而调用频率较高时，才能将此成员函数指定为内置函数。使用inline关键字。', 'c++', '鲁松');
INSERT INTO `lt_tie` VALUES ('55', '小知识点总结', '2016-07-13 18:07:04', 'normal', '3.类的数据成员是不能再声明类时初始化的。\r\n\r\n4.构造函数：是一种特殊的成员函数，与其他成员函数不同，不需要用户来调用它，而是在建立对象时自动执行。\\\r\n\r\n构造函数的名字必须与类名同名，而不能由用户任意命名，以便编译系统能识别它并把它作为构造函数处理。\r\n\r\n5.参数初始化表实现对数据成员的初始化，这种方法不在函数体内对数据成员初始化，而是在函数首部实现。\r\n\r\n举例：Box：Box(int h,int w,int len):height(h),width(w),length(len){}\r\n\r\n6.析构函数：也是一个特殊的成员函数，它的作用于构造函数相反，它的名字是类名前面加一个“~”符号，', 'c++', '鲁松');
INSERT INTO `lt_tie` VALUES ('56', '知识点总结（2）', '2016-07-13 18:07:28', 'normal', '在C++中“~”是取反运算符，从这点也可以想到：析构函数是与构造函数作用相反的函数。\r\n\r\n析构函数的作用并不是删除对象，而是在撤销对象占用内存之前完成一些清理工作。析构函数不能重载。（肯定的，无参怎么重载）\r\n\r\n7.this指针：在每一个成员函数中都包括一个特殊的指针，这个指针的名字是固定的，称为this。\r\n\r\n它是指向本类对象的指针，它的值是当前被调用的成员函数所在对象的起始地址。\r\n\r\n8.对象的常引用：把实参变量的地址传给形参，这样引用名也指向实参变量。', 'c++', '鲁松');
INSERT INTO `lt_tie` VALUES ('57', '对象的引用', '2016-07-13 18:08:23', 'normal', '#include <iostream>\r\nusing namespace std;\r\nclass Time{\r\n      public:\r\n             Time(int,int,int);\r\n             int hour;\r\n             int minute;\r\n             int sec;\r\n      };\r\nTime::Time(int h,int m,int s){\r\n               hour=h;\r\n               minute=m;\r\n               sec=s;\r\n               }\r\nvoid fun(Time &t){\r\n     t.hour=18;\r\n     }\r\nint main(){\r\n    Time t1(10,13,56);\r\n    fun(t1);\r\n    cout<<t1.hour<<endl;\r\n    getchar(); \r\n    return 0;\r\n    }', 'c++', '小爷神坑');
INSERT INTO `lt_tie` VALUES ('58', '函数的作用', '2016-07-13 18:08:53', 'normal', '1）、用于定义功能。\r\n\r\n2）、用于封装代码提高代码的复用性。\r\n\r\n注意：函数中只能调用函数，不能定义函数。', 'java', '小爷神坑');
INSERT INTO `lt_tie` VALUES ('59', '程序执行', '2016-07-13 18:09:40', 'normal', 'C#所开发的程序源代码并不是编译成能够直接在操作系统上执行的二进制本地代码。与Java类似，它被编译成为中间代码，然后通过.NETFramework的虚拟机——被称之为通用语言运行时（CLR）——执行。　所有的.Net编程语言都被编译成这种被称为MSIL（Microsoft Intermediate Language ）的中间代码。因此虽然最终的程序在表面上仍然与传统意义上的可执行文件都具有“.exe”的后缀名。但是实际上，如果计算机上没有安装.Net Framework，那么这些程序将不能够被执行。　在程序执行时，.Net Framework将中间代码翻译成为二进制机器码，从而使它得到正确的运行。最终的二进制代码被存储在一个缓冲区中。所以一旦程序使用了相同的代码，那么将会调用缓冲区中的版本。这样如果一个.Net程序第二次被运行，那么这种翻译不需要进行第二次，速度明显加快。', 'c#', '小爷神坑');
INSERT INTO `lt_tie` VALUES ('60', 'C#的部分关键字（等待你来补充哦）', '2016-07-13 18:10:20', 'normal', 'abstract：可以和类、方法、属性、索引器及事件一起使用，标识一个可以扩展但不能被实体化的、必须被实现的类或方法。\r\nas：一个转换操作符，如果转换失败，就返回null。\r\nbase：用于访问被派生类或构造中的同名成员隐藏的基类成员。\r\ncatch：定义一个代码块，在特定类型异常抛出时，执行块内代码。\r\nchecked：既是操作符又是语句，确保编译器运行时，检查整数类型操作或转换时出现的溢出。', 'c#', '小爷神坑');
INSERT INTO `lt_tie` VALUES ('61', '.javascript的消息框', '2016-07-13 18:11:42', 'better', '警告框：alert()\r\n\r\n确认框：confirm()\r\n\r\n提示框：prompt()', 'js', '小爷神坑');
INSERT INTO `lt_tie` VALUES ('62', 'JavaScript的事件（1）', '2016-07-13 18:12:39', 'normal', '（1）onload：某个页面或图像完成加载\r\n\r\n（2）onunload：用户退出页面\r\n\r\nonload和onunload事件常用来处理用户进入或离开页面时所建立的Cookies\r\n\r\n（3）onfocus：元素获得焦点\r\n\r\n（4）onblur：元素失去焦点\r\n\r\n（5）onchange：用户改变域的内容', 'js', '李玉明');
INSERT INTO `lt_tie` VALUES ('63', 'JavaScript的事件（2）', '2016-07-13 18:13:09', 'normal', '（6）onsubmit：提交按钮被点击。可以用来提交表单前验证所有的域，例如：<form method=\"post\" action=\"index.aspx\" onsubmit=\"return CheckForm()\"/>\r\n\r\n（7）onmouseover：鼠标被移动\r\n\r\n（8）onmouseout：鼠标从某元素移开\r\n\r\nonmouseover和onmouseout可以用来创建动态的按钮。\r\n\r\n（9）onclick：单击某个对象，OndblClick双击某个对象\r\n\r\n（10）onkeypress：某个键盘的键被按下或按住\r\n\r\n（11）onerror：加载文档或图像时发生某个错误\r\n\r\n\r\n', 'js', '李玉明');
INSERT INTO `lt_tie` VALUES ('64', '我来补充关键字啦 都进来看看', '2016-07-13 18:13:54', 'better', 'const：标识一个可在编译时计算出来的变量值，即一经指派不可修改的值。\r\ndelegate：指定一个声明为一种委托类型。委托把方法封装为可调用实体，能在委托实体中调用。\r\nenum：表示一个已命名常量群集的值类型。\r\nevent：允许一个类或对象提供通知的成员，他必须是委托类型。\r\nexplicit：一个定义用户自定义转换操作符的操作符，通常用来将内建类型转换为用户定义类型或反向操作，必须再转换时调用显示转换操作符。', 'c#', '李玉明');
INSERT INTO `lt_tie` VALUES ('65', '静态数据成员', '2016-07-13 18:14:55', 'normal', '以关键字static开头，如果想在同类的多个对象之间实现数据共享，也不要用全局对象，可以用静态的数据成员。\r\n\r\n静态数据成员可以初始化，但只能在类体外进行初始化。成员函数也可以定义为静态的，在类中声明函数的前面加static就成了静态\r\n\r\n成员函数。和静态数据成员一样，静态成员函数是类的一部分，而不是对象的一部分。如果要在类外调用共用的静态成员函数，要用\r\n\r\n类名和域运算符“：：”。静态员函数的作用不是为了对象之间的沟通，而是为了能处理静态数据成员。静态函数没有this指针。既\r\n\r\n然它没有指向某一对象，它就无法对一个对象中的非静态成员进默认访问（记在引用数据成员时不指定对象名）。', 'c++', '李玉明');
INSERT INTO `lt_tie` VALUES ('66', '友元', '2016-07-13 18:15:58', 'normal', '在本类中用friend对该函数进行声明此函数就称为本类的友元函数。一个类的有元函数可以访问这个类中的私有成员（破坏\r\n\r\n了封装性，但是要考，还是要记住）。Friend函数不仅可以是一般的函数（非成员函数），而且可以是另一类中的成员函数。\r\n\r\n一个函数（包括普通函数和成员函数）可以被多个类声明为“朋友”，这样就可以应用多个类中的私有数据', 'c++', '罗梦霞');
INSERT INTO `lt_tie` VALUES ('67', '派生类（通俗点说就是子类）', '2016-07-13 18:16:34', 'better', '在声明派生类时，派生类并没有把积累的构造函数继承过来，因此，对继承过来的基类成员初始化的工作也要用派生\r\n\r\n类的构造函数承担。所以在设计派生类的构造函数时，不仅要考虑派生类所增加的数据成员的初始化，还应当考虑\r\n\r\n基类的数据成员初始化。也就是说，希望在执行派生类的构造函数时，是派生类的数据成员和基类的数据成员同时都\r\n\r\n被初始化。解决这个问题的思路是：在执行派生类的构造函数时，调用基类的构造函数。\r\n\r\n在执行派生类的析构函数时，系统会自动调用基类函数的析构函数和子对象的析构函数，对基类和子对象进行清理。\r\n\r\n调用的顺序与析构函数正好相反，先执行派生类自己的析构函数，对派生类新增加的成员进行清理，然后调用子对象\r\n\r\n的析构函数，对子对象进行清理，最后调用基类的析构函数，对基类进行清理', 'c++', '罗梦霞');
INSERT INTO `lt_tie` VALUES ('68', '事件模拟', '2016-07-13 18:20:55', 'normal', '事件模拟是dom事件的一种高级应用，一般情况下用不到，但是一些极端情况下他是解决实际问题的杀手锏\r\n\r\n事件模拟是javascript事件机制中相当有用的功能，理解事件模拟与善用事件模拟是判别一个前端的重要依据，所以各位一定要深入理解\r\n\r\n事件一般是由用户操作触发，其实javascript也是可以触发的，比较重要的是，javascript模拟的触发遵循事件流机制！！！', 'js', '罗梦霞');
INSERT INTO `lt_tie` VALUES ('69', '延时执行', '2016-07-13 18:21:19', 'normal', '延时执行settimeout是javascript中的一道利器，很多时候一旦解决不了我们便会使用settimeout，但是对settimeout的理解上，很多初学的朋友有一定误区\r\n\r\n初学的朋友一般认为settimeout是在多少毫秒后便会被执行，事实上其后面的数据代表的是一个时间片，或者说是优先级，settimeout的回调会在主干程序之后执行', 'js', '罗梦霞');
INSERT INTO `lt_user` VALUES ('1', '王甘林', '123456', '9bd2b850-c20b-47fd-96da-c31b3264ecc9.jpg', null, '0', '13277958059', 'wgl@qq.com', null);
INSERT INTO `lt_user` VALUES ('2', '徐冬冬', '123456', 'a42236dd-0fa1-4863-8cba-961553491fed.jpg', null, '0', '15642564422', 'xdd@qq.com', null);
INSERT INTO `lt_user` VALUES ('3', '罗梦霞', '123456', '5f95df34-4e45-4668-a6ab-ebcab5d308ab.jpg', null, '0', '13026113909', 'lmx@qq.com', null);
INSERT INTO `lt_user` VALUES ('4', '李玉明', '123456', 'd92a7d5b-93f8-45c9-9e0c-4151f91b23d2.jpg', null, '0', '13564268954', 'lym@qq.com', null);
INSERT INTO `lt_user` VALUES ('5', '小爷神坑', '123456', '20e9633a-6b6c-4481-9308-e0b11f4eb743.jpg', null, '0', '13564266555', 'liuhong@qq.com', null);
INSERT INTO `lt_user` VALUES ('6', '管理员', 'admin', '4ae81e91-5fde-4d3b-b7ec-e7433ad9a860.jpg', null, '1', '', 'admin@qq.com', null);
INSERT INTO `lt_user` VALUES ('7', '陈梦林', '123456', '95f4c466-5632-46a6-a6df-fea06967ecf3.jpg', null, '0', '13007183314', 'cml@qq.com', null);
INSERT INTO `lt_user` VALUES ('8', '李田荣', '123456', '70984feb-976d-4d32-b7eb-8fcfc42c2fba.jpg', null, '0', '15656554466', 'ltr@qq.com', null);
INSERT INTO `lt_user` VALUES ('9', '王霞', '123456', 'd8fd5320-b7f7-439e-9ecf-bcf8bc4b411a.png', null, '0', '15688416368', 'wx@qq.com', null);
INSERT INTO `lt_user` VALUES ('10', '陈亚玲', '123456', null, null, null, '13465652685', 'cyl@qq.com', null);
INSERT INTO `lt_user` VALUES ('11', '鲁松', '123456', '70e501ad-240f-44bb-b2bf-ea16e5392ac7.jpg', null, '0', '15864454566', 'ls@qq.com', null);
