
schlieren128:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00000013          	nop
       4:	00001137          	lui	sp,0x1
       8:	40010113          	addi	sp,sp,1024 # 1400 <humidity+0x4>
       c:	06c0006f          	j	78 <main>

00000010 <Schlieren>:
      10:	fe010113          	addi	sp,sp,-32
      14:	00112e23          	sw	ra,28(sp)
      18:	00812c23          	sw	s0,24(sp)
      1c:	00912a23          	sw	s1,20(sp)
      20:	02010413          	addi	s0,sp,32
      24:	fea42623          	sw	a0,-20(s0)
      28:	feb42423          	sw	a1,-24(s0)
      2c:	fe842583          	lw	a1,-24(s0)
      30:	fec42503          	lw	a0,-20(s0)
      34:	168000ef          	jal	ra,19c <__addsf3>
      38:	00050793          	mv	a5,a0
      3c:	00078493          	mv	s1,a5
      40:	fe842583          	lw	a1,-24(s0)
      44:	fec42503          	lw	a0,-20(s0)
      48:	211000ef          	jal	ra,a58 <__subsf3>
      4c:	00050793          	mv	a5,a0
      50:	00078593          	mv	a1,a5
      54:	00048513          	mv	a0,s1
      58:	5dc000ef          	jal	ra,634 <__divsf3>
      5c:	00050793          	mv	a5,a0
      60:	00078513          	mv	a0,a5
      64:	01c12083          	lw	ra,28(sp)
      68:	01812403          	lw	s0,24(sp)
      6c:	01412483          	lw	s1,20(sp)
      70:	02010113          	addi	sp,sp,32
      74:	00008067          	ret

00000078 <main>:
      78:	fd010113          	addi	sp,sp,-48
      7c:	02112623          	sw	ra,44(sp)
      80:	02812423          	sw	s0,40(sp)
      84:	03010413          	addi	s0,sp,48
      88:	000027b7          	lui	a5,0x2
      8c:	fcf42e23          	sw	a5,-36(s0)
      90:	fdc42783          	lw	a5,-36(s0)
      94:	0ff00713          	li	a4,255
      98:	00e7a023          	sw	a4,0(a5) # 2000 <humidity+0xc04>
      9c:	fe042623          	sw	zero,-20(s0)
      a0:	0100006f          	j	b0 <main+0x38>
      a4:	fec42783          	lw	a5,-20(s0)
      a8:	00178793          	addi	a5,a5,1
      ac:	fef42623          	sw	a5,-20(s0)
      b0:	fec42703          	lw	a4,-20(s0)
      b4:	000627b7          	lui	a5,0x62
      b8:	a7f78793          	addi	a5,a5,-1409 # 61a7f <humidity+0x60683>
      bc:	fee7d4e3          	ble	a4,a5,a4 <main+0x2c>
      c0:	fdc42783          	lw	a5,-36(s0)
      c4:	0007a023          	sw	zero,0(a5)
      c8:	08000793          	li	a5,128
      cc:	fcf42c23          	sw	a5,-40(s0)
      d0:	fe042423          	sw	zero,-24(s0)
      d4:	0500006f          	j	124 <main+0xac>
      d8:	000017b7          	lui	a5,0x1
      dc:	fe842703          	lw	a4,-24(s0)
      e0:	00271713          	slli	a4,a4,0x2
      e4:	1fc78793          	addi	a5,a5,508 # 11fc <temp>
      e8:	00f707b3          	add	a5,a4,a5
      ec:	0007a683          	lw	a3,0(a5)
      f0:	000017b7          	lui	a5,0x1
      f4:	fe842703          	lw	a4,-24(s0)
      f8:	00271713          	slli	a4,a4,0x2
      fc:	3fc78793          	addi	a5,a5,1020 # 13fc <humidity>
     100:	00f707b3          	add	a5,a4,a5
     104:	0007a783          	lw	a5,0(a5)
     108:	00078593          	mv	a1,a5
     10c:	00068513          	mv	a0,a3
     110:	f01ff0ef          	jal	ra,10 <Schlieren>
     114:	fca42a23          	sw	a0,-44(s0)
     118:	fe842783          	lw	a5,-24(s0)
     11c:	00178793          	addi	a5,a5,1
     120:	fef42423          	sw	a5,-24(s0)
     124:	fe842703          	lw	a4,-24(s0)
     128:	fd842783          	lw	a5,-40(s0)
     12c:	faf746e3          	blt	a4,a5,d8 <main+0x60>
     130:	fdc42783          	lw	a5,-36(s0)
     134:	0ff00713          	li	a4,255
     138:	00e7a023          	sw	a4,0(a5)
     13c:	fdc42783          	lw	a5,-36(s0)
     140:	0ff00713          	li	a4,255
     144:	00e7a023          	sw	a4,0(a5)
     148:	fe042223          	sw	zero,-28(s0)
     14c:	0100006f          	j	15c <main+0xe4>
     150:	fe442783          	lw	a5,-28(s0)
     154:	00178793          	addi	a5,a5,1
     158:	fef42223          	sw	a5,-28(s0)
     15c:	fe442703          	lw	a4,-28(s0)
     160:	0000a7b7          	lui	a5,0xa
     164:	c3f78793          	addi	a5,a5,-961 # 9c3f <humidity+0x8843>
     168:	fee7d4e3          	ble	a4,a5,150 <main+0xd8>
     16c:	fdc42783          	lw	a5,-36(s0)
     170:	0007a023          	sw	zero,0(a5)
     174:	fe042023          	sw	zero,-32(s0)
     178:	0100006f          	j	188 <main+0x110>
     17c:	fe042783          	lw	a5,-32(s0)
     180:	00178793          	addi	a5,a5,1
     184:	fef42023          	sw	a5,-32(s0)
     188:	fe042703          	lw	a4,-32(s0)
     18c:	0000a7b7          	lui	a5,0xa
     190:	c3f78793          	addi	a5,a5,-961 # 9c3f <humidity+0x8843>
     194:	fee7d4e3          	ble	a4,a5,17c <main+0x104>
     198:	fa5ff06f          	j	13c <main+0xc4>

0000019c <__addsf3>:
     19c:	ff010113          	addi	sp,sp,-16
     1a0:	00800737          	lui	a4,0x800
     1a4:	0175d613          	srli	a2,a1,0x17
     1a8:	fff70713          	addi	a4,a4,-1 # 7fffff <humidity+0x7fec03>
     1ac:	00912223          	sw	s1,4(sp)
     1b0:	01755493          	srli	s1,a0,0x17
     1b4:	00a77333          	and	t1,a4,a0
     1b8:	0ff4f493          	andi	s1,s1,255
     1bc:	00b776b3          	and	a3,a4,a1
     1c0:	01212023          	sw	s2,0(sp)
     1c4:	00112623          	sw	ra,12(sp)
     1c8:	01f55913          	srli	s2,a0,0x1f
     1cc:	00812423          	sw	s0,8(sp)
     1d0:	0ff67513          	andi	a0,a2,255
     1d4:	01f5d593          	srli	a1,a1,0x1f
     1d8:	00030793          	mv	a5,t1
     1dc:	00048613          	mv	a2,s1
     1e0:	00090813          	mv	a6,s2
     1e4:	00331e13          	slli	t3,t1,0x3
     1e8:	00369e93          	slli	t4,a3,0x3
     1ec:	40a488b3          	sub	a7,s1,a0
     1f0:	14b90e63          	beq	s2,a1,34c <__addsf3+0x1b0>
     1f4:	13105263          	blez	a7,318 <__addsf3+0x17c>
     1f8:	1c050063          	beqz	a0,3b8 <__addsf3+0x21c>
     1fc:	0ff00793          	li	a5,255
     200:	1cf48863          	beq	s1,a5,3d0 <__addsf3+0x234>
     204:	040007b7          	lui	a5,0x4000
     208:	00feeeb3          	or	t4,t4,a5
     20c:	01b00793          	li	a5,27
     210:	3517c863          	blt	a5,a7,560 <__addsf3+0x3c4>
     214:	02000793          	li	a5,32
     218:	411787b3          	sub	a5,a5,a7
     21c:	00fe97b3          	sll	a5,t4,a5
     220:	011ed8b3          	srl	a7,t4,a7
     224:	00f037b3          	snez	a5,a5
     228:	00f8e7b3          	or	a5,a7,a5
     22c:	40fe07b3          	sub	a5,t3,a5
     230:	00579713          	slli	a4,a5,0x5
     234:	22075863          	bgez	a4,464 <__addsf3+0x2c8>
     238:	04000437          	lui	s0,0x4000
     23c:	fff40413          	addi	s0,s0,-1 # 3ffffff <humidity+0x3ffec03>
     240:	0087f433          	and	s0,a5,s0
     244:	00040513          	mv	a0,s0
     248:	5a1000ef          	jal	ra,fe8 <__clzsi2>
     24c:	ffb50513          	addi	a0,a0,-5
     250:	00a417b3          	sll	a5,s0,a0
     254:	24954663          	blt	a0,s1,4a0 <__addsf3+0x304>
     258:	40950533          	sub	a0,a0,s1
     25c:	00150413          	addi	s0,a0,1
     260:	02000713          	li	a4,32
     264:	40870733          	sub	a4,a4,s0
     268:	00e79733          	sll	a4,a5,a4
     26c:	00e03733          	snez	a4,a4
     270:	0087d7b3          	srl	a5,a5,s0
     274:	00e7e7b3          	or	a5,a5,a4
     278:	00000493          	li	s1,0
     27c:	0077f713          	andi	a4,a5,7
     280:	00070a63          	beqz	a4,294 <__addsf3+0xf8>
     284:	00f7f713          	andi	a4,a5,15
     288:	00400693          	li	a3,4
     28c:	00d70463          	beq	a4,a3,294 <__addsf3+0xf8>
     290:	00478793          	addi	a5,a5,4 # 4000004 <humidity+0x3ffec08>
     294:	00579713          	slli	a4,a5,0x5
     298:	1c075a63          	bgez	a4,46c <__addsf3+0x2d0>
     29c:	00148493          	addi	s1,s1,1
     2a0:	0ff00713          	li	a4,255
     2a4:	00090813          	mv	a6,s2
     2a8:	1ee48663          	beq	s1,a4,494 <__addsf3+0x2f8>
     2ac:	1f800737          	lui	a4,0x1f800
     2b0:	fff70713          	addi	a4,a4,-1 # 1f7fffff <humidity+0x1f7fec03>
     2b4:	0037d793          	srli	a5,a5,0x3
     2b8:	00e7f7b3          	and	a5,a5,a4
     2bc:	00800737          	lui	a4,0x800
     2c0:	fff70713          	addi	a4,a4,-1 # 7fffff <humidity+0x7fec03>
     2c4:	00e7f7b3          	and	a5,a5,a4
     2c8:	0ff4f613          	andi	a2,s1,255
     2cc:	00800537          	lui	a0,0x800
     2d0:	fff50513          	addi	a0,a0,-1 # 7fffff <humidity+0x7fec03>
     2d4:	00a7f7b3          	and	a5,a5,a0
     2d8:	80800537          	lui	a0,0x80800
     2dc:	fff50513          	addi	a0,a0,-1 # 807fffff <humidity+0x807fec03>
     2e0:	00a7f533          	and	a0,a5,a0
     2e4:	00c12083          	lw	ra,12(sp)
     2e8:	00812403          	lw	s0,8(sp)
     2ec:	01761613          	slli	a2,a2,0x17
     2f0:	800007b7          	lui	a5,0x80000
     2f4:	00c56533          	or	a0,a0,a2
     2f8:	fff7c793          	not	a5,a5
     2fc:	01f81813          	slli	a6,a6,0x1f
     300:	00f57533          	and	a0,a0,a5
     304:	00412483          	lw	s1,4(sp)
     308:	00012903          	lw	s2,0(sp)
     30c:	01056533          	or	a0,a0,a6
     310:	01010113          	addi	sp,sp,16
     314:	00008067          	ret
     318:	0c089663          	bnez	a7,3e4 <__addsf3+0x248>
     31c:	00148713          	addi	a4,s1,1
     320:	0fe77713          	andi	a4,a4,254
     324:	18071c63          	bnez	a4,4bc <__addsf3+0x320>
     328:	2a049863          	bnez	s1,5d8 <__addsf3+0x43c>
     32c:	260e0e63          	beqz	t3,5a8 <__addsf3+0x40c>
     330:	f80e8ee3          	beqz	t4,2cc <__addsf3+0x130>
     334:	41de07b3          	sub	a5,t3,t4
     338:	00579713          	slli	a4,a5,0x5
     33c:	2a075e63          	bgez	a4,5f8 <__addsf3+0x45c>
     340:	41ce87b3          	sub	a5,t4,t3
     344:	00058913          	mv	s2,a1
     348:	f35ff06f          	j	27c <__addsf3+0xe0>
     34c:	0d105e63          	blez	a7,428 <__addsf3+0x28c>
     350:	0a050e63          	beqz	a0,40c <__addsf3+0x270>
     354:	0ff00793          	li	a5,255
     358:	06f48c63          	beq	s1,a5,3d0 <__addsf3+0x234>
     35c:	040007b7          	lui	a5,0x4000
     360:	00feeeb3          	or	t4,t4,a5
     364:	01b00793          	li	a5,27
     368:	2917c063          	blt	a5,a7,5e8 <__addsf3+0x44c>
     36c:	02000793          	li	a5,32
     370:	411787b3          	sub	a5,a5,a7
     374:	00fe97b3          	sll	a5,t4,a5
     378:	011ed8b3          	srl	a7,t4,a7
     37c:	00f037b3          	snez	a5,a5
     380:	00f8e7b3          	or	a5,a7,a5
     384:	01c787b3          	add	a5,a5,t3
     388:	00579713          	slli	a4,a5,0x5
     38c:	0c075c63          	bgez	a4,464 <__addsf3+0x2c8>
     390:	00148493          	addi	s1,s1,1
     394:	0ff00713          	li	a4,255
     398:	0ee48e63          	beq	s1,a4,494 <__addsf3+0x2f8>
     39c:	7e0006b7          	lui	a3,0x7e000
     3a0:	0017d713          	srli	a4,a5,0x1
     3a4:	fff68693          	addi	a3,a3,-1 # 7dffffff <humidity+0x7dffec03>
     3a8:	0017f793          	andi	a5,a5,1
     3ac:	00d77733          	and	a4,a4,a3
     3b0:	00f767b3          	or	a5,a4,a5
     3b4:	ec9ff06f          	j	27c <__addsf3+0xe0>
     3b8:	0a0e8c63          	beqz	t4,470 <__addsf3+0x2d4>
     3bc:	fff88893          	addi	a7,a7,-1
     3c0:	41de07b3          	sub	a5,t3,t4
     3c4:	e60886e3          	beqz	a7,230 <__addsf3+0x94>
     3c8:	0ff00793          	li	a5,255
     3cc:	e4f490e3          	bne	s1,a5,20c <__addsf3+0x70>
     3d0:	0c030063          	beqz	t1,490 <__addsf3+0x2f4>
     3d4:	00000813          	li	a6,0
     3d8:	0ff00613          	li	a2,255
     3dc:	004007b7          	lui	a5,0x400
     3e0:	eedff06f          	j	2cc <__addsf3+0x130>
     3e4:	40950733          	sub	a4,a0,s1
     3e8:	12049c63          	bnez	s1,520 <__addsf3+0x384>
     3ec:	1a0e0063          	beqz	t3,58c <__addsf3+0x3f0>
     3f0:	fff70713          	addi	a4,a4,-1
     3f4:	20070a63          	beqz	a4,608 <__addsf3+0x46c>
     3f8:	0ff00793          	li	a5,255
     3fc:	12f51a63          	bne	a0,a5,530 <__addsf3+0x394>
     400:	00058913          	mv	s2,a1
     404:	00068313          	mv	t1,a3
     408:	fc9ff06f          	j	3d0 <__addsf3+0x234>
     40c:	060e8263          	beqz	t4,470 <__addsf3+0x2d4>
     410:	fff88893          	addi	a7,a7,-1
     414:	01de07b3          	add	a5,t3,t4
     418:	f60888e3          	beqz	a7,388 <__addsf3+0x1ec>
     41c:	0ff00793          	li	a5,255
     420:	f4f492e3          	bne	s1,a5,364 <__addsf3+0x1c8>
     424:	fadff06f          	j	3d0 <__addsf3+0x234>
     428:	0a089a63          	bnez	a7,4dc <__addsf3+0x340>
     42c:	00148493          	addi	s1,s1,1
     430:	0fe4f713          	andi	a4,s1,254
     434:	18071263          	bnez	a4,5b8 <__addsf3+0x41c>
     438:	16061263          	bnez	a2,59c <__addsf3+0x400>
     43c:	1c0e0e63          	beqz	t3,618 <__addsf3+0x47c>
     440:	e80e86e3          	beqz	t4,2cc <__addsf3+0x130>
     444:	01de07b3          	add	a5,t3,t4
     448:	00579713          	slli	a4,a5,0x5
     44c:	00000493          	li	s1,0
     450:	00075a63          	bgez	a4,464 <__addsf3+0x2c8>
     454:	fc000737          	lui	a4,0xfc000
     458:	fff70713          	addi	a4,a4,-1 # fbffffff <humidity+0xfbffec03>
     45c:	00e7f7b3          	and	a5,a5,a4
     460:	00100493          	li	s1,1
     464:	0077f713          	andi	a4,a5,7
     468:	e0071ee3          	bnez	a4,284 <__addsf3+0xe8>
     46c:	0037d313          	srli	t1,a5,0x3
     470:	0ff00793          	li	a5,255
     474:	f4f48ee3          	beq	s1,a5,3d0 <__addsf3+0x234>
     478:	008007b7          	lui	a5,0x800
     47c:	fff78793          	addi	a5,a5,-1 # 7fffff <humidity+0x7fec03>
     480:	00f377b3          	and	a5,t1,a5
     484:	0ff4f613          	andi	a2,s1,255
     488:	00090813          	mv	a6,s2
     48c:	e41ff06f          	j	2cc <__addsf3+0x130>
     490:	00090813          	mv	a6,s2
     494:	0ff00613          	li	a2,255
     498:	00000793          	li	a5,0
     49c:	e31ff06f          	j	2cc <__addsf3+0x130>
     4a0:	fc000737          	lui	a4,0xfc000
     4a4:	fff70713          	addi	a4,a4,-1 # fbffffff <humidity+0xfbffec03>
     4a8:	00e7f7b3          	and	a5,a5,a4
     4ac:	0077f713          	andi	a4,a5,7
     4b0:	40a484b3          	sub	s1,s1,a0
     4b4:	dc0718e3          	bnez	a4,284 <__addsf3+0xe8>
     4b8:	fb5ff06f          	j	46c <__addsf3+0x2d0>
     4bc:	41de0433          	sub	s0,t3,t4
     4c0:	00541793          	slli	a5,s0,0x5
     4c4:	1007c463          	bltz	a5,5cc <__addsf3+0x430>
     4c8:	d6041ee3          	bnez	s0,244 <__addsf3+0xa8>
     4cc:	00000813          	li	a6,0
     4d0:	00000613          	li	a2,0
     4d4:	00000793          	li	a5,0
     4d8:	df5ff06f          	j	2cc <__addsf3+0x130>
     4dc:	40950733          	sub	a4,a0,s1
     4e0:	08048463          	beqz	s1,568 <__addsf3+0x3cc>
     4e4:	0ff00793          	li	a5,255
     4e8:	f0f50ee3          	beq	a0,a5,404 <__addsf3+0x268>
     4ec:	040007b7          	lui	a5,0x4000
     4f0:	00fe6e33          	or	t3,t3,a5
     4f4:	01b00793          	li	a5,27
     4f8:	12e7ca63          	blt	a5,a4,62c <__addsf3+0x490>
     4fc:	02000793          	li	a5,32
     500:	40e787b3          	sub	a5,a5,a4
     504:	00fe17b3          	sll	a5,t3,a5
     508:	00ee5733          	srl	a4,t3,a4
     50c:	00f037b3          	snez	a5,a5
     510:	00f767b3          	or	a5,a4,a5
     514:	01d787b3          	add	a5,a5,t4
     518:	00050493          	mv	s1,a0
     51c:	e6dff06f          	j	388 <__addsf3+0x1ec>
     520:	0ff00793          	li	a5,255
     524:	ecf50ee3          	beq	a0,a5,400 <__addsf3+0x264>
     528:	040007b7          	lui	a5,0x4000
     52c:	00fe6e33          	or	t3,t3,a5
     530:	01b00793          	li	a5,27
     534:	0ae7ce63          	blt	a5,a4,5f0 <__addsf3+0x454>
     538:	02000693          	li	a3,32
     53c:	40e686b3          	sub	a3,a3,a4
     540:	00de16b3          	sll	a3,t3,a3
     544:	00ee57b3          	srl	a5,t3,a4
     548:	00d03733          	snez	a4,a3
     54c:	00e7e7b3          	or	a5,a5,a4
     550:	40fe87b3          	sub	a5,t4,a5
     554:	00050493          	mv	s1,a0
     558:	00058913          	mv	s2,a1
     55c:	cd5ff06f          	j	230 <__addsf3+0x94>
     560:	00100793          	li	a5,1
     564:	cc9ff06f          	j	22c <__addsf3+0x90>
     568:	0a0e0c63          	beqz	t3,620 <__addsf3+0x484>
     56c:	fff70713          	addi	a4,a4,-1
     570:	01de07b3          	add	a5,t3,t4
     574:	00050493          	mv	s1,a0
     578:	e00708e3          	beqz	a4,388 <__addsf3+0x1ec>
     57c:	0ff00793          	li	a5,255
     580:	f6f51ae3          	bne	a0,a5,4f4 <__addsf3+0x358>
     584:	00068313          	mv	t1,a3
     588:	e49ff06f          	j	3d0 <__addsf3+0x234>
     58c:	00068313          	mv	t1,a3
     590:	00050493          	mv	s1,a0
     594:	00058913          	mv	s2,a1
     598:	ed9ff06f          	j	470 <__addsf3+0x2d4>
     59c:	e60e04e3          	beqz	t3,404 <__addsf3+0x268>
     5a0:	e20e88e3          	beqz	t4,3d0 <__addsf3+0x234>
     5a4:	e31ff06f          	j	3d4 <__addsf3+0x238>
     5a8:	040e8a63          	beqz	t4,5fc <__addsf3+0x460>
     5ac:	00058813          	mv	a6,a1
     5b0:	00068793          	mv	a5,a3
     5b4:	d19ff06f          	j	2cc <__addsf3+0x130>
     5b8:	0ff00793          	li	a5,255
     5bc:	ecf48ce3          	beq	s1,a5,494 <__addsf3+0x2f8>
     5c0:	01de07b3          	add	a5,t3,t4
     5c4:	0017d793          	srli	a5,a5,0x1
     5c8:	e9dff06f          	j	464 <__addsf3+0x2c8>
     5cc:	41ce8433          	sub	s0,t4,t3
     5d0:	00058913          	mv	s2,a1
     5d4:	c71ff06f          	j	244 <__addsf3+0xa8>
     5d8:	fc0e14e3          	bnez	t3,5a0 <__addsf3+0x404>
     5dc:	de0e8ce3          	beqz	t4,3d4 <__addsf3+0x238>
     5e0:	00058913          	mv	s2,a1
     5e4:	e21ff06f          	j	404 <__addsf3+0x268>
     5e8:	00100793          	li	a5,1
     5ec:	d99ff06f          	j	384 <__addsf3+0x1e8>
     5f0:	00100793          	li	a5,1
     5f4:	f5dff06f          	j	550 <__addsf3+0x3b4>
     5f8:	e60796e3          	bnez	a5,464 <__addsf3+0x2c8>
     5fc:	00000813          	li	a6,0
     600:	00000793          	li	a5,0
     604:	cc9ff06f          	j	2cc <__addsf3+0x130>
     608:	41ce87b3          	sub	a5,t4,t3
     60c:	00050493          	mv	s1,a0
     610:	00058913          	mv	s2,a1
     614:	c1dff06f          	j	230 <__addsf3+0x94>
     618:	00068793          	mv	a5,a3
     61c:	cb1ff06f          	j	2cc <__addsf3+0x130>
     620:	00068313          	mv	t1,a3
     624:	00050493          	mv	s1,a0
     628:	e49ff06f          	j	470 <__addsf3+0x2d4>
     62c:	00100793          	li	a5,1
     630:	ee5ff06f          	j	514 <__addsf3+0x378>

00000634 <__divsf3>:
     634:	fc010113          	addi	sp,sp,-64
     638:	02812c23          	sw	s0,56(sp)
     63c:	01755793          	srli	a5,a0,0x17
     640:	00800437          	lui	s0,0x800
     644:	03412423          	sw	s4,40(sp)
     648:	03612023          	sw	s6,32(sp)
     64c:	01f55a13          	srli	s4,a0,0x1f
     650:	fff40413          	addi	s0,s0,-1 # 7fffff <humidity+0x7fec03>
     654:	02112e23          	sw	ra,60(sp)
     658:	02912a23          	sw	s1,52(sp)
     65c:	03212823          	sw	s2,48(sp)
     660:	03312623          	sw	s3,44(sp)
     664:	03512223          	sw	s5,36(sp)
     668:	01712e23          	sw	s7,28(sp)
     66c:	01812c23          	sw	s8,24(sp)
     670:	0ff7f793          	andi	a5,a5,255
     674:	00a47433          	and	s0,s0,a0
     678:	000a0b13          	mv	s6,s4
     67c:	1a078063          	beqz	a5,81c <__divsf3+0x1e8>
     680:	0ff00713          	li	a4,255
     684:	1ae78663          	beq	a5,a4,830 <__divsf3+0x1fc>
     688:	00341413          	slli	s0,s0,0x3
     68c:	04000737          	lui	a4,0x4000
     690:	00e46433          	or	s0,s0,a4
     694:	f8178993          	addi	s3,a5,-127 # 3ffff81 <humidity+0x3ffeb85>
     698:	00000493          	li	s1,0
     69c:	00000b93          	li	s7,0
     6a0:	0175d793          	srli	a5,a1,0x17
     6a4:	00800937          	lui	s2,0x800
     6a8:	fff90913          	addi	s2,s2,-1 # 7fffff <humidity+0x7fec03>
     6ac:	0ff7f793          	andi	a5,a5,255
     6b0:	00b97933          	and	s2,s2,a1
     6b4:	01f5da93          	srli	s5,a1,0x1f
     6b8:	14078c63          	beqz	a5,810 <__divsf3+0x1dc>
     6bc:	0ff00713          	li	a4,255
     6c0:	02e78e63          	beq	a5,a4,6fc <__divsf3+0xc8>
     6c4:	04000737          	lui	a4,0x4000
     6c8:	00391913          	slli	s2,s2,0x3
     6cc:	f8178793          	addi	a5,a5,-127
     6d0:	00e96933          	or	s2,s2,a4
     6d4:	40f989b3          	sub	s3,s3,a5
     6d8:	00000713          	li	a4,0
     6dc:	009764b3          	or	s1,a4,s1
     6e0:	000017b7          	lui	a5,0x1
     6e4:	07c78793          	addi	a5,a5,124 # 107c <_etext>
     6e8:	00249493          	slli	s1,s1,0x2
     6ec:	00f484b3          	add	s1,s1,a5
     6f0:	0004a783          	lw	a5,0(s1)
     6f4:	015a4a33          	xor	s4,s4,s5
     6f8:	00078067          	jr	a5
     6fc:	f0198993          	addi	s3,s3,-255
     700:	14091263          	bnez	s2,844 <__divsf3+0x210>
     704:	00200713          	li	a4,2
     708:	009764b3          	or	s1,a4,s1
     70c:	000017b7          	lui	a5,0x1
     710:	0bc78793          	addi	a5,a5,188 # 10bc <_etext+0x40>
     714:	00249493          	slli	s1,s1,0x2
     718:	00f484b3          	add	s1,s1,a5
     71c:	0004a783          	lw	a5,0(s1)
     720:	015a4a33          	xor	s4,s4,s5
     724:	00078067          	jr	a5
     728:	00000a13          	li	s4,0
     72c:	0ff00793          	li	a5,255
     730:	00400537          	lui	a0,0x400
     734:	00800437          	lui	s0,0x800
     738:	fff40413          	addi	s0,s0,-1 # 7fffff <humidity+0x7fec03>
     73c:	00857533          	and	a0,a0,s0
     740:	80800437          	lui	s0,0x80800
     744:	fff40413          	addi	s0,s0,-1 # 807fffff <humidity+0x807fec03>
     748:	00857533          	and	a0,a0,s0
     74c:	03c12083          	lw	ra,60(sp)
     750:	03812403          	lw	s0,56(sp)
     754:	01779793          	slli	a5,a5,0x17
     758:	01fa1a13          	slli	s4,s4,0x1f
     75c:	00f56533          	or	a0,a0,a5
     760:	01456533          	or	a0,a0,s4
     764:	03412483          	lw	s1,52(sp)
     768:	03012903          	lw	s2,48(sp)
     76c:	02c12983          	lw	s3,44(sp)
     770:	02812a03          	lw	s4,40(sp)
     774:	02412a83          	lw	s5,36(sp)
     778:	02012b03          	lw	s6,32(sp)
     77c:	01c12b83          	lw	s7,28(sp)
     780:	01812c03          	lw	s8,24(sp)
     784:	04010113          	addi	sp,sp,64
     788:	00008067          	ret
     78c:	0ff00793          	li	a5,255
     790:	00000513          	li	a0,0
     794:	fa1ff06f          	j	734 <__divsf3+0x100>
     798:	00090413          	mv	s0,s2
     79c:	000a8b13          	mv	s6,s5
     7a0:	00070b93          	mv	s7,a4
     7a4:	00200793          	li	a5,2
     7a8:	2afb8063          	beq	s7,a5,a48 <__divsf3+0x414>
     7ac:	00300793          	li	a5,3
     7b0:	f6fb8ce3          	beq	s7,a5,728 <__divsf3+0xf4>
     7b4:	00100793          	li	a5,1
     7b8:	0efb8863          	beq	s7,a5,8a8 <__divsf3+0x274>
     7bc:	07f98793          	addi	a5,s3,127
     7c0:	001b7a13          	andi	s4,s6,1
     7c4:	1cf05663          	blez	a5,990 <__divsf3+0x35c>
     7c8:	00747713          	andi	a4,s0,7
     7cc:	00070a63          	beqz	a4,7e0 <__divsf3+0x1ac>
     7d0:	00f47713          	andi	a4,s0,15
     7d4:	00400693          	li	a3,4
     7d8:	00d70463          	beq	a4,a3,7e0 <__divsf3+0x1ac>
     7dc:	00440413          	addi	s0,s0,4
     7e0:	00441713          	slli	a4,s0,0x4
     7e4:	00075a63          	bgez	a4,7f8 <__divsf3+0x1c4>
     7e8:	f80007b7          	lui	a5,0xf8000
     7ec:	fff78793          	addi	a5,a5,-1 # f7ffffff <humidity+0xf7ffec03>
     7f0:	00f47433          	and	s0,s0,a5
     7f4:	08098793          	addi	a5,s3,128
     7f8:	0fe00713          	li	a4,254
     7fc:	f8f748e3          	blt	a4,a5,78c <__divsf3+0x158>
     800:	00641513          	slli	a0,s0,0x6
     804:	00955513          	srli	a0,a0,0x9
     808:	0ff7f793          	andi	a5,a5,255
     80c:	f29ff06f          	j	734 <__divsf3+0x100>
     810:	06091c63          	bnez	s2,888 <__divsf3+0x254>
     814:	00100713          	li	a4,1
     818:	ef1ff06f          	j	708 <__divsf3+0xd4>
     81c:	04041063          	bnez	s0,85c <__divsf3+0x228>
     820:	00400493          	li	s1,4
     824:	00000993          	li	s3,0
     828:	00100b93          	li	s7,1
     82c:	e75ff06f          	j	6a0 <__divsf3+0x6c>
     830:	00041e63          	bnez	s0,84c <__divsf3+0x218>
     834:	00800493          	li	s1,8
     838:	0ff00993          	li	s3,255
     83c:	00200b93          	li	s7,2
     840:	e61ff06f          	j	6a0 <__divsf3+0x6c>
     844:	00300713          	li	a4,3
     848:	e95ff06f          	j	6dc <__divsf3+0xa8>
     84c:	00c00493          	li	s1,12
     850:	0ff00993          	li	s3,255
     854:	00300b93          	li	s7,3
     858:	e49ff06f          	j	6a0 <__divsf3+0x6c>
     85c:	00040513          	mv	a0,s0
     860:	00b12623          	sw	a1,12(sp)
     864:	784000ef          	jal	ra,fe8 <__clzsi2>
     868:	ffb50793          	addi	a5,a0,-5 # 3ffffb <humidity+0x3febff>
     86c:	00f41433          	sll	s0,s0,a5
     870:	f8a00793          	li	a5,-118
     874:	40a789b3          	sub	s3,a5,a0
     878:	00000493          	li	s1,0
     87c:	00000b93          	li	s7,0
     880:	00c12583          	lw	a1,12(sp)
     884:	e1dff06f          	j	6a0 <__divsf3+0x6c>
     888:	00090513          	mv	a0,s2
     88c:	75c000ef          	jal	ra,fe8 <__clzsi2>
     890:	ffb50713          	addi	a4,a0,-5
     894:	00a987b3          	add	a5,s3,a0
     898:	00e91933          	sll	s2,s2,a4
     89c:	07678993          	addi	s3,a5,118
     8a0:	00000713          	li	a4,0
     8a4:	e39ff06f          	j	6dc <__divsf3+0xa8>
     8a8:	001b7a13          	andi	s4,s6,1
     8ac:	00000793          	li	a5,0
     8b0:	00000513          	li	a0,0
     8b4:	e81ff06f          	j	734 <__divsf3+0x100>
     8b8:	00010ab7          	lui	s5,0x10
     8bc:	00591b93          	slli	s7,s2,0x5
     8c0:	fffa8a93          	addi	s5,s5,-1 # ffff <humidity+0xec03>
     8c4:	010bdb13          	srli	s6,s7,0x10
     8c8:	015bfab3          	and	s5,s7,s5
     8cc:	13247263          	bleu	s2,s0,9f0 <__divsf3+0x3bc>
     8d0:	000b0593          	mv	a1,s6
     8d4:	00040513          	mv	a0,s0
     8d8:	664000ef          	jal	ra,f3c <__udivsi3>
     8dc:	000a8593          	mv	a1,s5
     8e0:	00050913          	mv	s2,a0
     8e4:	62c000ef          	jal	ra,f10 <__mulsi3>
     8e8:	00040c13          	mv	s8,s0
     8ec:	00050493          	mv	s1,a0
     8f0:	fff98993          	addi	s3,s3,-1
     8f4:	00000413          	li	s0,0
     8f8:	000b0593          	mv	a1,s6
     8fc:	000c0513          	mv	a0,s8
     900:	684000ef          	jal	ra,f84 <__umodsi3>
     904:	01051513          	slli	a0,a0,0x10
     908:	00856533          	or	a0,a0,s0
     90c:	00957e63          	bleu	s1,a0,928 <__divsf3+0x2f4>
     910:	01750533          	add	a0,a0,s7
     914:	fff90793          	addi	a5,s2,-1
     918:	11756e63          	bltu	a0,s7,a34 <__divsf3+0x400>
     91c:	10957c63          	bleu	s1,a0,a34 <__divsf3+0x400>
     920:	ffe90913          	addi	s2,s2,-2
     924:	01750533          	add	a0,a0,s7
     928:	409504b3          	sub	s1,a0,s1
     92c:	000b0593          	mv	a1,s6
     930:	00048513          	mv	a0,s1
     934:	608000ef          	jal	ra,f3c <__udivsi3>
     938:	000a8593          	mv	a1,s5
     93c:	00050c13          	mv	s8,a0
     940:	5d0000ef          	jal	ra,f10 <__mulsi3>
     944:	00050413          	mv	s0,a0
     948:	000b0593          	mv	a1,s6
     94c:	00048513          	mv	a0,s1
     950:	634000ef          	jal	ra,f84 <__umodsi3>
     954:	01051513          	slli	a0,a0,0x10
     958:	00857e63          	bleu	s0,a0,974 <__divsf3+0x340>
     95c:	01750533          	add	a0,a0,s7
     960:	fffc0793          	addi	a5,s8,-1
     964:	0d756463          	bltu	a0,s7,a2c <__divsf3+0x3f8>
     968:	0c857263          	bleu	s0,a0,a2c <__divsf3+0x3f8>
     96c:	ffec0c13          	addi	s8,s8,-2
     970:	01750533          	add	a0,a0,s7
     974:	01091793          	slli	a5,s2,0x10
     978:	40850433          	sub	s0,a0,s0
     97c:	0187e7b3          	or	a5,a5,s8
     980:	00803433          	snez	s0,s0
     984:	0087e433          	or	s0,a5,s0
     988:	000a0b13          	mv	s6,s4
     98c:	e31ff06f          	j	7bc <__divsf3+0x188>
     990:	00100713          	li	a4,1
     994:	40f70733          	sub	a4,a4,a5
     998:	00078a63          	beqz	a5,9ac <__divsf3+0x378>
     99c:	01b00693          	li	a3,27
     9a0:	00000793          	li	a5,0
     9a4:	00000513          	li	a0,0
     9a8:	d8e6c6e3          	blt	a3,a4,734 <__divsf3+0x100>
     9ac:	09e98513          	addi	a0,s3,158
     9b0:	00a41533          	sll	a0,s0,a0
     9b4:	00a03533          	snez	a0,a0
     9b8:	00e45433          	srl	s0,s0,a4
     9bc:	00a46533          	or	a0,s0,a0
     9c0:	00757793          	andi	a5,a0,7
     9c4:	00078a63          	beqz	a5,9d8 <__divsf3+0x3a4>
     9c8:	00f57793          	andi	a5,a0,15
     9cc:	00400713          	li	a4,4
     9d0:	00e78463          	beq	a5,a4,9d8 <__divsf3+0x3a4>
     9d4:	00450513          	addi	a0,a0,4
     9d8:	00551793          	slli	a5,a0,0x5
     9dc:	0607c063          	bltz	a5,a3c <__divsf3+0x408>
     9e0:	00651513          	slli	a0,a0,0x6
     9e4:	00955513          	srli	a0,a0,0x9
     9e8:	00000793          	li	a5,0
     9ec:	d49ff06f          	j	734 <__divsf3+0x100>
     9f0:	00145c13          	srli	s8,s0,0x1
     9f4:	000b0593          	mv	a1,s6
     9f8:	000c0513          	mv	a0,s8
     9fc:	540000ef          	jal	ra,f3c <__udivsi3>
     a00:	000a8593          	mv	a1,s5
     a04:	00050913          	mv	s2,a0
     a08:	01f41413          	slli	s0,s0,0x1f
     a0c:	504000ef          	jal	ra,f10 <__mulsi3>
     a10:	00050493          	mv	s1,a0
     a14:	01045413          	srli	s0,s0,0x10
     a18:	ee1ff06f          	j	8f8 <__divsf3+0x2c4>
     a1c:	000a8b13          	mv	s6,s5
     a20:	00070b93          	mv	s7,a4
     a24:	00000413          	li	s0,0
     a28:	d7dff06f          	j	7a4 <__divsf3+0x170>
     a2c:	00078c13          	mv	s8,a5
     a30:	f45ff06f          	j	974 <__divsf3+0x340>
     a34:	00078913          	mv	s2,a5
     a38:	ef1ff06f          	j	928 <__divsf3+0x2f4>
     a3c:	00100793          	li	a5,1
     a40:	00000513          	li	a0,0
     a44:	cf1ff06f          	j	734 <__divsf3+0x100>
     a48:	001b7a13          	andi	s4,s6,1
     a4c:	0ff00793          	li	a5,255
     a50:	00000513          	li	a0,0
     a54:	ce1ff06f          	j	734 <__divsf3+0x100>

00000a58 <__subsf3>:
     a58:	00800737          	lui	a4,0x800
     a5c:	ff010113          	addi	sp,sp,-16
     a60:	fff70713          	addi	a4,a4,-1 # 7fffff <humidity+0x7fec03>
     a64:	01755693          	srli	a3,a0,0x17
     a68:	0175d813          	srli	a6,a1,0x17
     a6c:	00a777b3          	and	a5,a4,a0
     a70:	0ff6f693          	andi	a3,a3,255
     a74:	01f55313          	srli	t1,a0,0x1f
     a78:	00b77633          	and	a2,a4,a1
     a7c:	00912223          	sw	s1,4(sp)
     a80:	01212023          	sw	s2,0(sp)
     a84:	0ff87813          	andi	a6,a6,255
     a88:	00112623          	sw	ra,12(sp)
     a8c:	00812423          	sw	s0,8(sp)
     a90:	0ff00513          	li	a0,255
     a94:	00078e13          	mv	t3,a5
     a98:	00068913          	mv	s2,a3
     a9c:	00030493          	mv	s1,t1
     aa0:	00379f13          	slli	t5,a5,0x3
     aa4:	01f5d593          	srli	a1,a1,0x1f
     aa8:	00361e93          	slli	t4,a2,0x3
     aac:	410688b3          	sub	a7,a3,a6
     ab0:	16a80863          	beq	a6,a0,c20 <__subsf3+0x1c8>
     ab4:	0015c593          	xori	a1,a1,1
     ab8:	18b30463          	beq	t1,a1,c40 <__subsf3+0x1e8>
     abc:	13105663          	blez	a7,be8 <__subsf3+0x190>
     ac0:	16081663          	bnez	a6,c2c <__subsf3+0x1d4>
     ac4:	280e8263          	beqz	t4,d48 <__subsf3+0x2f0>
     ac8:	fff88893          	addi	a7,a7,-1
     acc:	41df07b3          	sub	a5,t5,t4
     ad0:	02088863          	beqz	a7,b00 <__subsf3+0xa8>
     ad4:	0ff00793          	li	a5,255
     ad8:	1ef68c63          	beq	a3,a5,cd0 <__subsf3+0x278>
     adc:	01b00793          	li	a5,27
     ae0:	3517cc63          	blt	a5,a7,e38 <__subsf3+0x3e0>
     ae4:	02000713          	li	a4,32
     ae8:	41170733          	sub	a4,a4,a7
     aec:	00ee9733          	sll	a4,t4,a4
     af0:	011ed7b3          	srl	a5,t4,a7
     af4:	00e03733          	snez	a4,a4
     af8:	00e7e7b3          	or	a5,a5,a4
     afc:	40ff07b3          	sub	a5,t5,a5
     b00:	00579713          	slli	a4,a5,0x5
     b04:	22075c63          	bgez	a4,d3c <__subsf3+0x2e4>
     b08:	04000437          	lui	s0,0x4000
     b0c:	fff40413          	addi	s0,s0,-1 # 3ffffff <humidity+0x3ffec03>
     b10:	0087f433          	and	s0,a5,s0
     b14:	00040513          	mv	a0,s0
     b18:	4d0000ef          	jal	ra,fe8 <__clzsi2>
     b1c:	ffb50513          	addi	a0,a0,-5
     b20:	00a417b3          	sll	a5,s0,a0
     b24:	25254a63          	blt	a0,s2,d78 <__subsf3+0x320>
     b28:	41250533          	sub	a0,a0,s2
     b2c:	00150413          	addi	s0,a0,1
     b30:	02000713          	li	a4,32
     b34:	40870733          	sub	a4,a4,s0
     b38:	00e79733          	sll	a4,a5,a4
     b3c:	00e03733          	snez	a4,a4
     b40:	0087d7b3          	srl	a5,a5,s0
     b44:	00e7e7b3          	or	a5,a5,a4
     b48:	00000913          	li	s2,0
     b4c:	0077f713          	andi	a4,a5,7
     b50:	00070a63          	beqz	a4,b64 <__subsf3+0x10c>
     b54:	00f7f713          	andi	a4,a5,15
     b58:	00400693          	li	a3,4
     b5c:	00d70463          	beq	a4,a3,b64 <__subsf3+0x10c>
     b60:	00478793          	addi	a5,a5,4
     b64:	00579713          	slli	a4,a5,0x5
     b68:	1c075e63          	bgez	a4,d44 <__subsf3+0x2ec>
     b6c:	00190913          	addi	s2,s2,1
     b70:	0ff00713          	li	a4,255
     b74:	0014f313          	andi	t1,s1,1
     b78:	1ee90a63          	beq	s2,a4,d6c <__subsf3+0x314>
     b7c:	1f800737          	lui	a4,0x1f800
     b80:	fff70713          	addi	a4,a4,-1 # 1f7fffff <humidity+0x1f7fec03>
     b84:	0037d793          	srli	a5,a5,0x3
     b88:	00e7f7b3          	and	a5,a5,a4
     b8c:	00800737          	lui	a4,0x800
     b90:	fff70713          	addi	a4,a4,-1 # 7fffff <humidity+0x7fec03>
     b94:	00e7f7b3          	and	a5,a5,a4
     b98:	0ff97693          	andi	a3,s2,255
     b9c:	00800537          	lui	a0,0x800
     ba0:	fff50513          	addi	a0,a0,-1 # 7fffff <humidity+0x7fec03>
     ba4:	00a7f7b3          	and	a5,a5,a0
     ba8:	80800537          	lui	a0,0x80800
     bac:	fff50513          	addi	a0,a0,-1 # 807fffff <humidity+0x807fec03>
     bb0:	00a7f533          	and	a0,a5,a0
     bb4:	00c12083          	lw	ra,12(sp)
     bb8:	00812403          	lw	s0,8(sp)
     bbc:	01769693          	slli	a3,a3,0x17
     bc0:	800007b7          	lui	a5,0x80000
     bc4:	00d56533          	or	a0,a0,a3
     bc8:	fff7c793          	not	a5,a5
     bcc:	01f31713          	slli	a4,t1,0x1f
     bd0:	00f57533          	and	a0,a0,a5
     bd4:	00412483          	lw	s1,4(sp)
     bd8:	00012903          	lw	s2,0(sp)
     bdc:	00e56533          	or	a0,a0,a4
     be0:	01010113          	addi	sp,sp,16
     be4:	00008067          	ret
     be8:	0c089263          	bnez	a7,cac <__subsf3+0x254>
     bec:	00168713          	addi	a4,a3,1
     bf0:	0fe77713          	andi	a4,a4,254
     bf4:	1a071063          	bnez	a4,d94 <__subsf3+0x33c>
     bf8:	2a069c63          	bnez	a3,eb0 <__subsf3+0x458>
     bfc:	280f0263          	beqz	t5,e80 <__subsf3+0x428>
     c00:	f80e8ee3          	beqz	t4,b9c <__subsf3+0x144>
     c04:	41df07b3          	sub	a5,t5,t4
     c08:	00579713          	slli	a4,a5,0x5
     c0c:	2c075263          	bgez	a4,ed0 <__subsf3+0x478>
     c10:	41ee87b3          	sub	a5,t4,t5
     c14:	00000913          	li	s2,0
     c18:	00058493          	mv	s1,a1
     c1c:	f31ff06f          	j	b4c <__subsf3+0xf4>
     c20:	e80e8ae3          	beqz	t4,ab4 <__subsf3+0x5c>
     c24:	0cb30e63          	beq	t1,a1,d00 <__subsf3+0x2a8>
     c28:	fd1050e3          	blez	a7,be8 <__subsf3+0x190>
     c2c:	0ff00793          	li	a5,255
     c30:	0af68063          	beq	a3,a5,cd0 <__subsf3+0x278>
     c34:	040007b7          	lui	a5,0x4000
     c38:	00feeeb3          	or	t4,t4,a5
     c3c:	ea1ff06f          	j	adc <__subsf3+0x84>
     c40:	0d105063          	blez	a7,d00 <__subsf3+0x2a8>
     c44:	0a080063          	beqz	a6,ce4 <__subsf3+0x28c>
     c48:	0ff00793          	li	a5,255
     c4c:	08f68263          	beq	a3,a5,cd0 <__subsf3+0x278>
     c50:	040007b7          	lui	a5,0x4000
     c54:	00feeeb3          	or	t4,t4,a5
     c58:	01b00793          	li	a5,27
     c5c:	2717c263          	blt	a5,a7,ec0 <__subsf3+0x468>
     c60:	02000713          	li	a4,32
     c64:	41170733          	sub	a4,a4,a7
     c68:	00ee9733          	sll	a4,t4,a4
     c6c:	011ed7b3          	srl	a5,t4,a7
     c70:	00e03733          	snez	a4,a4
     c74:	00e7e7b3          	or	a5,a5,a4
     c78:	01e787b3          	add	a5,a5,t5
     c7c:	00579713          	slli	a4,a5,0x5
     c80:	0a075e63          	bgez	a4,d3c <__subsf3+0x2e4>
     c84:	00190913          	addi	s2,s2,1
     c88:	0ff00713          	li	a4,255
     c8c:	0ee90063          	beq	s2,a4,d6c <__subsf3+0x314>
     c90:	7e0006b7          	lui	a3,0x7e000
     c94:	0017d713          	srli	a4,a5,0x1
     c98:	fff68693          	addi	a3,a3,-1 # 7dffffff <humidity+0x7dffec03>
     c9c:	0017f793          	andi	a5,a5,1
     ca0:	00d77733          	and	a4,a4,a3
     ca4:	00f767b3          	or	a5,a4,a5
     ca8:	ea5ff06f          	j	b4c <__subsf3+0xf4>
     cac:	40d80733          	sub	a4,a6,a3
     cb0:	14069463          	bnez	a3,df8 <__subsf3+0x3a0>
     cb4:	1a0f0863          	beqz	t5,e64 <__subsf3+0x40c>
     cb8:	fff70713          	addi	a4,a4,-1
     cbc:	22070463          	beqz	a4,ee4 <__subsf3+0x48c>
     cc0:	0ff00793          	li	a5,255
     cc4:	14f81263          	bne	a6,a5,e08 <__subsf3+0x3b0>
     cc8:	00058493          	mv	s1,a1
     ccc:	00060e13          	mv	t3,a2
     cd0:	080e0c63          	beqz	t3,d68 <__subsf3+0x310>
     cd4:	00000313          	li	t1,0
     cd8:	0ff00693          	li	a3,255
     cdc:	004007b7          	lui	a5,0x400
     ce0:	ebdff06f          	j	b9c <__subsf3+0x144>
     ce4:	060e8263          	beqz	t4,d48 <__subsf3+0x2f0>
     ce8:	fff88893          	addi	a7,a7,-1
     cec:	01df07b3          	add	a5,t5,t4
     cf0:	f80886e3          	beqz	a7,c7c <__subsf3+0x224>
     cf4:	0ff00793          	li	a5,255
     cf8:	f6f690e3          	bne	a3,a5,c58 <__subsf3+0x200>
     cfc:	fd5ff06f          	j	cd0 <__subsf3+0x278>
     d00:	0a089a63          	bnez	a7,db4 <__subsf3+0x35c>
     d04:	00168913          	addi	s2,a3,1
     d08:	0fe97713          	andi	a4,s2,254
     d0c:	18071263          	bnez	a4,e90 <__subsf3+0x438>
     d10:	16069263          	bnez	a3,e74 <__subsf3+0x41c>
     d14:	1e0f0063          	beqz	t5,ef4 <__subsf3+0x49c>
     d18:	e80e82e3          	beqz	t4,b9c <__subsf3+0x144>
     d1c:	01df07b3          	add	a5,t5,t4
     d20:	00579713          	slli	a4,a5,0x5
     d24:	00000913          	li	s2,0
     d28:	00075a63          	bgez	a4,d3c <__subsf3+0x2e4>
     d2c:	fc000737          	lui	a4,0xfc000
     d30:	fff70713          	addi	a4,a4,-1 # fbffffff <humidity+0xfbffec03>
     d34:	00e7f7b3          	and	a5,a5,a4
     d38:	00100913          	li	s2,1
     d3c:	0077f713          	andi	a4,a5,7
     d40:	e0071ae3          	bnez	a4,b54 <__subsf3+0xfc>
     d44:	0037de13          	srli	t3,a5,0x3
     d48:	0ff00793          	li	a5,255
     d4c:	f8f902e3          	beq	s2,a5,cd0 <__subsf3+0x278>
     d50:	008007b7          	lui	a5,0x800
     d54:	fff78793          	addi	a5,a5,-1 # 7fffff <humidity+0x7fec03>
     d58:	00fe77b3          	and	a5,t3,a5
     d5c:	0ff97693          	andi	a3,s2,255
     d60:	0014f313          	andi	t1,s1,1
     d64:	e39ff06f          	j	b9c <__subsf3+0x144>
     d68:	0014f313          	andi	t1,s1,1
     d6c:	0ff00693          	li	a3,255
     d70:	00000793          	li	a5,0
     d74:	e29ff06f          	j	b9c <__subsf3+0x144>
     d78:	fc000737          	lui	a4,0xfc000
     d7c:	fff70713          	addi	a4,a4,-1 # fbffffff <humidity+0xfbffec03>
     d80:	00e7f7b3          	and	a5,a5,a4
     d84:	0077f713          	andi	a4,a5,7
     d88:	40a90933          	sub	s2,s2,a0
     d8c:	dc0714e3          	bnez	a4,b54 <__subsf3+0xfc>
     d90:	fb5ff06f          	j	d44 <__subsf3+0x2ec>
     d94:	41df0433          	sub	s0,t5,t4
     d98:	00541793          	slli	a5,s0,0x5
     d9c:	1007c463          	bltz	a5,ea4 <__subsf3+0x44c>
     da0:	d6041ae3          	bnez	s0,b14 <__subsf3+0xbc>
     da4:	00000313          	li	t1,0
     da8:	00000693          	li	a3,0
     dac:	00000793          	li	a5,0
     db0:	dedff06f          	j	b9c <__subsf3+0x144>
     db4:	40d80733          	sub	a4,a6,a3
     db8:	08068463          	beqz	a3,e40 <__subsf3+0x3e8>
     dbc:	0ff00793          	li	a5,255
     dc0:	f0f806e3          	beq	a6,a5,ccc <__subsf3+0x274>
     dc4:	040007b7          	lui	a5,0x4000
     dc8:	00ff6f33          	or	t5,t5,a5
     dcc:	01b00793          	li	a5,27
     dd0:	12e7cc63          	blt	a5,a4,f08 <__subsf3+0x4b0>
     dd4:	02000793          	li	a5,32
     dd8:	40e787b3          	sub	a5,a5,a4
     ddc:	00ff17b3          	sll	a5,t5,a5
     de0:	00ef5733          	srl	a4,t5,a4
     de4:	00f037b3          	snez	a5,a5
     de8:	00f76733          	or	a4,a4,a5
     dec:	01d707b3          	add	a5,a4,t4
     df0:	00080913          	mv	s2,a6
     df4:	e89ff06f          	j	c7c <__subsf3+0x224>
     df8:	0ff00793          	li	a5,255
     dfc:	ecf806e3          	beq	a6,a5,cc8 <__subsf3+0x270>
     e00:	040007b7          	lui	a5,0x4000
     e04:	00ff6f33          	or	t5,t5,a5
     e08:	01b00793          	li	a5,27
     e0c:	0ae7ce63          	blt	a5,a4,ec8 <__subsf3+0x470>
     e10:	02000793          	li	a5,32
     e14:	40e787b3          	sub	a5,a5,a4
     e18:	00ff17b3          	sll	a5,t5,a5
     e1c:	00ef5733          	srl	a4,t5,a4
     e20:	00f037b3          	snez	a5,a5
     e24:	00f76733          	or	a4,a4,a5
     e28:	40ee87b3          	sub	a5,t4,a4
     e2c:	00080913          	mv	s2,a6
     e30:	00058493          	mv	s1,a1
     e34:	ccdff06f          	j	b00 <__subsf3+0xa8>
     e38:	00100793          	li	a5,1
     e3c:	cc1ff06f          	j	afc <__subsf3+0xa4>
     e40:	0a0f0e63          	beqz	t5,efc <__subsf3+0x4a4>
     e44:	fff70713          	addi	a4,a4,-1
     e48:	01df07b3          	add	a5,t5,t4
     e4c:	00080913          	mv	s2,a6
     e50:	e20706e3          	beqz	a4,c7c <__subsf3+0x224>
     e54:	0ff00793          	li	a5,255
     e58:	f6f81ae3          	bne	a6,a5,dcc <__subsf3+0x374>
     e5c:	00060e13          	mv	t3,a2
     e60:	e71ff06f          	j	cd0 <__subsf3+0x278>
     e64:	00060e13          	mv	t3,a2
     e68:	00080913          	mv	s2,a6
     e6c:	00058493          	mv	s1,a1
     e70:	ed9ff06f          	j	d48 <__subsf3+0x2f0>
     e74:	e40f0ce3          	beqz	t5,ccc <__subsf3+0x274>
     e78:	e40e8ce3          	beqz	t4,cd0 <__subsf3+0x278>
     e7c:	e59ff06f          	j	cd4 <__subsf3+0x27c>
     e80:	040e8c63          	beqz	t4,ed8 <__subsf3+0x480>
     e84:	00058313          	mv	t1,a1
     e88:	00060793          	mv	a5,a2
     e8c:	d11ff06f          	j	b9c <__subsf3+0x144>
     e90:	0ff00793          	li	a5,255
     e94:	ecf90ce3          	beq	s2,a5,d6c <__subsf3+0x314>
     e98:	01df07b3          	add	a5,t5,t4
     e9c:	0017d793          	srli	a5,a5,0x1
     ea0:	e9dff06f          	j	d3c <__subsf3+0x2e4>
     ea4:	41ee8433          	sub	s0,t4,t5
     ea8:	00058493          	mv	s1,a1
     eac:	c69ff06f          	j	b14 <__subsf3+0xbc>
     eb0:	fc0f14e3          	bnez	t5,e78 <__subsf3+0x420>
     eb4:	e20e80e3          	beqz	t4,cd4 <__subsf3+0x27c>
     eb8:	00058493          	mv	s1,a1
     ebc:	e11ff06f          	j	ccc <__subsf3+0x274>
     ec0:	00100793          	li	a5,1
     ec4:	db5ff06f          	j	c78 <__subsf3+0x220>
     ec8:	00100713          	li	a4,1
     ecc:	f5dff06f          	j	e28 <__subsf3+0x3d0>
     ed0:	00000913          	li	s2,0
     ed4:	e60794e3          	bnez	a5,d3c <__subsf3+0x2e4>
     ed8:	00000313          	li	t1,0
     edc:	00000793          	li	a5,0
     ee0:	cbdff06f          	j	b9c <__subsf3+0x144>
     ee4:	41ee87b3          	sub	a5,t4,t5
     ee8:	00080913          	mv	s2,a6
     eec:	00058493          	mv	s1,a1
     ef0:	c11ff06f          	j	b00 <__subsf3+0xa8>
     ef4:	00060793          	mv	a5,a2
     ef8:	ca5ff06f          	j	b9c <__subsf3+0x144>
     efc:	00060e13          	mv	t3,a2
     f00:	00080913          	mv	s2,a6
     f04:	e45ff06f          	j	d48 <__subsf3+0x2f0>
     f08:	00100713          	li	a4,1
     f0c:	ee1ff06f          	j	dec <__subsf3+0x394>

00000f10 <__mulsi3>:
     f10:	00050613          	mv	a2,a0
     f14:	00000513          	li	a0,0
     f18:	0015f693          	andi	a3,a1,1
     f1c:	00068463          	beqz	a3,f24 <__mulsi3+0x14>
     f20:	00c50533          	add	a0,a0,a2
     f24:	0015d593          	srli	a1,a1,0x1
     f28:	00161613          	slli	a2,a2,0x1
     f2c:	fe0596e3          	bnez	a1,f18 <__mulsi3+0x8>
     f30:	00008067          	ret

00000f34 <__divsi3>:
     f34:	06054063          	bltz	a0,f94 <__umodsi3+0x10>
     f38:	0605c663          	bltz	a1,fa4 <__umodsi3+0x20>

00000f3c <__udivsi3>:
     f3c:	00058613          	mv	a2,a1
     f40:	00050593          	mv	a1,a0
     f44:	fff00513          	li	a0,-1
     f48:	02060c63          	beqz	a2,f80 <__udivsi3+0x44>
     f4c:	00100693          	li	a3,1
     f50:	00b67a63          	bleu	a1,a2,f64 <__udivsi3+0x28>
     f54:	00c05863          	blez	a2,f64 <__udivsi3+0x28>
     f58:	00161613          	slli	a2,a2,0x1
     f5c:	00169693          	slli	a3,a3,0x1
     f60:	feb66ae3          	bltu	a2,a1,f54 <__udivsi3+0x18>
     f64:	00000513          	li	a0,0
     f68:	00c5e663          	bltu	a1,a2,f74 <__udivsi3+0x38>
     f6c:	40c585b3          	sub	a1,a1,a2
     f70:	00d56533          	or	a0,a0,a3
     f74:	0016d693          	srli	a3,a3,0x1
     f78:	00165613          	srli	a2,a2,0x1
     f7c:	fe0696e3          	bnez	a3,f68 <__udivsi3+0x2c>
     f80:	00008067          	ret

00000f84 <__umodsi3>:
     f84:	00008293          	mv	t0,ra
     f88:	fb5ff0ef          	jal	ra,f3c <__udivsi3>
     f8c:	00058513          	mv	a0,a1
     f90:	00028067          	jr	t0
     f94:	40a00533          	neg	a0,a0
     f98:	0005d863          	bgez	a1,fa8 <__umodsi3+0x24>
     f9c:	40b005b3          	neg	a1,a1
     fa0:	f9dff06f          	j	f3c <__udivsi3>
     fa4:	40b005b3          	neg	a1,a1
     fa8:	00008293          	mv	t0,ra
     fac:	f91ff0ef          	jal	ra,f3c <__udivsi3>
     fb0:	40a00533          	neg	a0,a0
     fb4:	00028067          	jr	t0

00000fb8 <__modsi3>:
     fb8:	00008293          	mv	t0,ra
     fbc:	0005ca63          	bltz	a1,fd0 <__modsi3+0x18>
     fc0:	00054c63          	bltz	a0,fd8 <__modsi3+0x20>
     fc4:	f79ff0ef          	jal	ra,f3c <__udivsi3>
     fc8:	00058513          	mv	a0,a1
     fcc:	00028067          	jr	t0
     fd0:	40b005b3          	neg	a1,a1
     fd4:	fe0558e3          	bgez	a0,fc4 <__modsi3+0xc>
     fd8:	40a00533          	neg	a0,a0
     fdc:	f61ff0ef          	jal	ra,f3c <__udivsi3>
     fe0:	40b00533          	neg	a0,a1
     fe4:	00028067          	jr	t0

00000fe8 <__clzsi2>:
     fe8:	000107b7          	lui	a5,0x10
     fec:	04f57463          	bleu	a5,a0,1034 <__clzsi2+0x4c>
     ff0:	0ff00793          	li	a5,255
     ff4:	02000713          	li	a4,32
     ff8:	00a7ee63          	bltu	a5,a0,1014 <__clzsi2+0x2c>
     ffc:	000017b7          	lui	a5,0x1
    1000:	0fc78793          	addi	a5,a5,252 # 10fc <__clz_tab>
    1004:	00f50533          	add	a0,a0,a5
    1008:	00054503          	lbu	a0,0(a0)
    100c:	40a70533          	sub	a0,a4,a0
    1010:	00008067          	ret
    1014:	000017b7          	lui	a5,0x1
    1018:	0fc78793          	addi	a5,a5,252 # 10fc <__clz_tab>
    101c:	00855513          	srli	a0,a0,0x8
    1020:	00f50533          	add	a0,a0,a5
    1024:	00054503          	lbu	a0,0(a0)
    1028:	01800713          	li	a4,24
    102c:	40a70533          	sub	a0,a4,a0
    1030:	00008067          	ret
    1034:	010007b7          	lui	a5,0x1000
    1038:	02f56263          	bltu	a0,a5,105c <__clzsi2+0x74>
    103c:	000017b7          	lui	a5,0x1
    1040:	0fc78793          	addi	a5,a5,252 # 10fc <__clz_tab>
    1044:	01855513          	srli	a0,a0,0x18
    1048:	00f50533          	add	a0,a0,a5
    104c:	00054503          	lbu	a0,0(a0)
    1050:	00800713          	li	a4,8
    1054:	40a70533          	sub	a0,a4,a0
    1058:	00008067          	ret
    105c:	000017b7          	lui	a5,0x1
    1060:	0fc78793          	addi	a5,a5,252 # 10fc <__clz_tab>
    1064:	01055513          	srli	a0,a0,0x10
    1068:	00f50533          	add	a0,a0,a5
    106c:	00054503          	lbu	a0,0(a0)
    1070:	01000713          	li	a4,16
    1074:	40a70533          	sub	a0,a4,a0
    1078:	00008067          	ret
