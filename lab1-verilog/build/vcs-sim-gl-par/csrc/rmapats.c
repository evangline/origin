#include <stdio.h>
#include <stdlib.h>
#include "rmapats.h"

typedef unsigned char UB;
typedef unsigned char scalar;
typedef unsigned short US;
#ifndef __DO_RMAHDR_
typedef unsigned int U;
#endif
#if defined(__sparcv9) || defined(__LP64__) || defined(_LP64) || defined(__ia64)
typedef unsigned long UP;
typedef unsigned long RP;
#else
typedef unsigned int UP;
typedef unsigned int RP;
#endif
typedef void (*FP)(void* pcode, scalar val);
typedef void (*FPV)(void* pcode, void* pval);
typedef void (*FP1)(void *);
typedef void (*FPLSEL)(void *, scalar, U);
typedef void (*FPLSELV)(void *, void*, U, U);

#ifdef __cplusplus
  extern "C" {
#endif

#if (_MSC_VER >= 900)
#define RMA_UL unsigned __int64
#else
#define RMA_UL long long unsigned
#endif
typedef union {
    double dummy;
#if defined(__GNUC__) || defined(__STDC__) || defined(__alpha) ||  \
    defined(_AIX) || (_MSC_VER >= 900) || defined(__sony_news) || defined(__cplusplus)
    RMA_UL clockL;
#endif
    unsigned int  clock_hl[2];
} rma_clock_struct;

typedef struct {
        RP pnext;
}RmaDbsLoad;

#define RmaTcCoreCommon   \
                RP pts;   \
                RP pdata; \
                U limit:30, \
                  floaded:1, \
                  fskew:1 

typedef struct {
        RP pnext;
        RmaTcCoreCommon;
}RmaTcCoreSimple;

typedef struct {
        RP pnext;
        RmaTcCoreCommon;
        RP ptscond;
}RmaTcCoreConditional;

typedef struct {
        RmaTcCoreCommon;
}RmaTcCoreSimpleNoList;

typedef struct { 
        RmaTcCoreCommon;
        RP ptscond;
}RmaTcCoreConditionalNoList;

#define RmaTSLoadCommon \
        RP pcondval; \
        U tscond;    \
        scalar condval

typedef struct {
        RmaTSLoadCommon;
}RmaConditionalTSLoadNoList;

typedef struct {
        RP pnext;
        RmaTSLoadCommon;
}RmaConditionalTSLoad;

typedef struct { 
        void* daiCbkList;
        void* aliasIp;
        U     aliasQsymId;
 } RmaDaiCg;

typedef struct { 
        void* vecCbkList;
 } RmaRootCbkCg;

typedef struct { 
        U vrpId;
 } RmaRootVcdCg;

typedef struct { 
        RP forceCbkList;
 } RmaRootForceCbkCg;

typedef struct { 
        EBLK eblk;
        RP pval;
        vec32 sv32;
 } RmaAnySchedVCg;

typedef struct { 
        EBLK eblk;
        RP pval;
        vec32 sv[1];
 } RmaAnySchedWCg;

typedef struct { 
        EBLK eblk;
        RP pval;
        scalar sascalar[1];
 } RmaAnySchedECg;

extern scalar Xunion[], Xwor[], Xwand[], Xvalchg[];
extern scalar X3val[], X4val[], XcvtstrTR[], Xbuf[], Xbitnot[],Xwor[], Xwand[];
extern void *memcpy(void* s1, void* s2, unsigned n);
extern void *mempcpy(void* s1, void* s2, unsigned n);
extern int memcmp(void* s1, void* s2, unsigned n);
extern scalar globalTable1Input[];
extern RP rmaSchedFunctionArr[];
extern unsigned long long vcs_clocks;
extern UB gHsimDumpScalVal;
extern UB gHsimPliScalVal;
extern U fCallbackHsimNode;
extern U fVcdDumpHsimNode;
extern U fVpdDumpHsimNode;
extern U fRTFrcRelCbk;
extern UB* rmaEvalDelays(UB* pcode, scalar val);
extern void rmaPopTransEvent(UB* pcode);
extern void (*txpFnPtr)(UB* pcode, U);
extern void (*propForceCbkSPostSchedCgFnPtr)(void* ip);
extern void (*propForceCbkMemoptSPostSchedCgFnPtr)(void* ip);
extern void rmaSetupFuncArray(UP* ra);
extern void SinitHsimPats(void);
extern void VVrpDaicb(void* ip, U nIndex);
extern int SDaicb(void *ip, U nIndex);
extern void SDaicbForHsimNoFlagScalar(void* pDaiCb, unsigned char value);
extern void SDaicbForHsimNoFlagStrengthScalar(void* pDaiCb, unsigned char value);
extern void SDaicbForHsimNoFlag(void* pRmaDaiCg, unsigned char value);
extern void SDaicbForHsimNoFlag2(void* pRmaDaiCg, unsigned char value);
extern void SDaicbForHsimWithFlag(void* pRmaDaiCg, unsigned char value);
extern void SDaicbForHsimNoFlagFrcRel(void* pRmaDaiCg, unsigned char reason, int msb, int lsb, int ndx);
extern void SDaicbForHsimNoFlagFrcRel2(void* pRmaDaiCg, unsigned char reason, int msb, int lsb, int ndx);
extern void VcsHsimValueChangeCB(void* pRmaDaiCg, void* pValue, unsigned int valueFormat);
extern U isNonDesignNodeCallbackList(void* pRmaDaiCg);
extern void SDaicbForHsimCbkMemOptNoFlagScalar(void* pDaiCb, unsigned char value, unsigned char isStrength);
extern void SDaicbForHsimCbkMemOptWithFlagScalar(void* pDaiCb, unsigned char value, unsigned char isStrength);
extern void SDaicbForHsimCbkMemOptNoFlagScalar(void* pDaiCb, unsigned char value, unsigned char isStrength);
extern void SDaicbForHsimCbkMemOptWithFlagScalar(void* pDaiCb, unsigned char value, unsigned char isStrength);
extern void VVrpNonEventNonRegdScalarForHsimOptCbkMemopt(void* ip, U nIndex);
extern void SDaicbForHsimCbkMemOptNoFlagDynElabScalar(U* mem, unsigned char value, unsigned char isStrength);
extern void SDaicbForHsimCbkMemOptWithFlagDynElabScalar(U* mem, unsigned char value, unsigned char isStrength);
extern void SDaicbForHsimCbkMemOptNoFlagDynElabFrcRel(U* mem, unsigned char reason, int msb, int lsb, int ndx);
extern void SDaicbForHsimCbkMemOptNoFlagFrcRel(void* pDaiCb, unsigned char reason, int msb, int lsb, int ndx);
extern void hsimDispatchCbkMemOptForVcd(RP p, U val);
extern void* hsimGetCbkMemOptCallback(RP p);
extern void hsimDispatchCbkMemOptNoDynElabS(RP p, U val, U isStrength);
extern void* hsimGetCbkPtrNoDynElab(RP p);
extern void hsimDispatchCbkMemOptDynElabS(U** pvcdarr, U** pcbkarr, U val, U isStrength);
extern void hsimDispatchCbkMemOptNoDynElabVector(RP /*RmaDaiOptCg* */p, void* pval, U /*RmaValueType*/ vt, U cbits);
extern void copyAndPropRootCbkCgS(RmaRootCbkCg* pRootCbk, scalar val);
extern void copyAndPropRootCbkCgV(RmaRootCbkCg* rootCbk, vec32* pval);
extern void copyAndPropRootCbkCgW(RmaRootCbkCg* rootCbk, vec32* pval);
extern void copyAndPropRootCbkCgE(RmaRootCbkCg* rootCbk, scalar* pval);
extern void dumpRootVcdCg(RmaRootVcdCg* pRootVcd, scalar val);
extern void checkAndConvertVec32To2State(vec32* value, vec32* svalue, U cbits, U* pforcedBits);
extern void (*rmaPostAnySchedFnPtr)(EBLK* peblk);
extern void (*rmaPostAnySchedVFnPtr)(RmaAnySchedVCg* psched);
extern void (*rmaPostAnySchedWFnPtr)(RmaAnySchedWCg* psched);
extern void (*rmaPostAnySchedEFnPtr)(RmaAnySchedECg* psched);
extern void (*rmaPostSchedUpdateClockStatusFnPtr)(EBLK* peblk);
extern unsigned int fGblDataOrTime0Prop;
extern void SchedSemiLerMP1(UB* pmps, U partId);
extern void hsUpdateModpathTimeStamp(UB* pmps);
extern void doMpd32One(UB* pmps);
extern void SchedSemiLerMP(UB* ppulse, U partId);
extern void scheduleuna(UB *e, U t);
extern void scheduleuna_mp(EBLK *e, unsigned t);
extern void schedule(UB *e, U t);
extern void sched_hsopt(struct dummyq_struct * pQ, EBLK *e, U t);
extern void sched_millenium(struct dummyq_struct * pQ, EBLK *e, U thigh, U t);
extern void schedule_1(EBLK *e);
extern void sched0(UB *e);
extern void sched0lq(UB *e);
extern void sched0una(UB *e);
extern void sched0una_th(struct dummyq_struct *pq, UB *e);
extern void scheduleuna_mp_th(struct dummyq_struct *pq, EBLK *e, unsigned t);
extern void schedal(UB *e);
extern void sched0_th(struct dummyq_struct * pQ, UB *e);
extern void sched0_hsim_front_th(struct dummyq_struct * pQ, UB *e);
extern void sched0_hsim_frontlq_th(struct dummyq_struct * pQ, UB *e);
extern void sched0lq_th(struct dummyq_struct * pQ, UB *e);
extern void schedal_th(struct dummyq_struct * pQ, UB *e);
extern void scheduleuna_th(struct dummyq_struct * pQ, UB *e, U t);
extern void schedule_th(struct dummyq_struct * pQ, UB *e, U t);
extern void schedule_1_th(struct dummyq_struct * pQ, EBLK *peblk);
extern void SetupLER_th(struct dummyq_struct * pQ, UB *e);
extern void SchedSemiLer_th(struct dummyq_struct * pQ, EBLK *e);
extern U getVcdFlags(UB *ip);
extern void VVrpNonEventNonRegdScalarForHsimOpt(void* ip, U nIndex);
extern void VVrpNonEventNonRegdScalarForHsimOpt2(void* ip, U nIndex);
extern void SchedSemiLerTBReactiveRegion(struct eblk* peblk);
extern void SchedSemiLerTBReactiveRegion_th(struct eblk* peblk, U partId);
extern void SchedSemiLerTr(UB* peblk, U partId);
extern void appendNtcEvent(UB* phdr, scalar s, U schedDelta);
extern void hsimRegisterEdge(void* sm,  scalar s);
extern U pvcsGetPartId();
extern void HsimPVCSPartIdCheck(U instNo);
extern void debug_func(U partId, struct dummyq_struct* pQ, EBLK* EblkLastEventx); 
extern struct dummyq_struct* pvcsGetQ(U thid);
extern EBLK* pvcsGetLastEventEblk(U thid);
extern void insertTransEvent(RmaTransEventHdr* phdr, scalar s, scalar pv,	scalar resval, U schedDelta, int re, UB* predd, U fpdd);
extern void insertNtcEventRF(RmaTransEventHdr* phdr, scalar s, scalar pv, scalar resval, U schedDelta, U* delays);
extern U doTimingViolation(U ts,RP* pdata, U fskew, U limit, U floaded);
extern int getCurSchedRegion();
extern FP getRoutPtr(RP, U);
extern U rmaChangeCheckAndUpdateE(scalar* pvalDst, scalar* pvalSrc, U cbits);
extern void rmaUpdateE(scalar* pvalDst, scalar* pvalSrc, U cbits);
extern U rmaChangeCheckAndUpdateEFromW(scalar* pvalDst, vec32* pvalSrc, U cbits);
extern void rmaLhsPartSelUpdateE(scalar* pvalDst, scalar* pvalSrc, U index, U width);
extern void rmaUpdateWithForceSelectorE(scalar* pvalDst, scalar* pvalSrc, U cbits, U* pforceSelector);
extern void rmaUpdateWFromE(vec32* pvalDst, scalar* pvalSrc, U cbits);
extern U rmaLhsPartSelWithChangeCheckE(scalar* pvalDst, scalar* pvalSrc, U index, U width);
extern void rmaLhsPartSelWFromE(vec32* pvalDst, scalar* pvalSrc, U index,U width);
extern U rmaChangeCheckAndUpdateW(vec32* pvalDst, vec32* pvalSrc, U cbits);
extern void rmaUpdateW(vec32* pvalDst, vec32* pvalSrc, U cbits);
extern void rmaUpdateEFromW(scalar* pvalDst, vec32* pvalSrc, U cbits);
extern U rmaLhsPartSelWithChangeCheckW(vec32* pvalDst, vec32* pvalSrc, U index,U width);
extern void rmaLhsPartSelEFromW(scalar* pvalDst, vec32* pvalSrc, U index,U width);
extern void rmaLhsPartSelUpdateW(vec32* pvalDst, vec32* pvalSrc, U index, U width);
extern void rmaEvalWunionW(vec32* dst, vec32* src, U cbits, U count);
extern void rmaEvalWorW(vec32* dst, vec32* src, U cbits, U count);
extern void rmaEvalWandW(vec32* dst, vec32* src, U cbits, U count);
extern void rmaEvalUnionE(scalar* dst, scalar* src, U cbits, U count, RP ptable);
extern RmaIbfPcode* rmaEvalPartSelectsW(vec32* pvec32, U startIndex, U onWidth, U offWidth, U count, RmaIbfPcode* pibfPcode);
extern RmaIbfPcode* rmaEvalPartSelectsEToE(scalar* pv, U startIndex, U onWidth, U offWidth, U count, RmaIbfPcode* pibfPcode);
extern RmaIbfPcode* rmaEvalPartSelectsEToW(scalar* pv, U startIndex, U onWidth, U offWidth, U count, RmaIbfPcode* pibfPcode);
extern U VcsForceVecVCg(UB* pcode, UB* pval, UB* pvDst, UB* pvCur, U fullcbits, U ibeginSrc, U ibeginDst, U width, U/*RmaValueConvType*/ convtype, U/*RmaForceType*/ frcType, UB* prhs, UB* prhsDst, U frhs, U* pforcedbits, U fisRoot);
extern U VcsReleaseVecVCg(UB* pcode, UB* pvDst, U fullcbits, U ibeginDst, U width, UB* prhsDst, U frhs, U* pforcedbits, U fisRoot);
extern U VcsDriveBitsAndDoChangeCheckV(vec32* pvSel, vec32* pvCur, U fullcbits, U forcedbits, U isRoot);
extern void cgvecDebug_Eblk(UB* pcode);
#ifdef __cplusplus
  }
#endif
scalar dummyScalar;
scalar fScalarIsForced=0;
scalar fScalarIsReleased=0;
scalar fScalarHasChanged=0;
extern int curSchedRegion;
extern RP* iparr;
extern int fNotimingchecks;
typedef struct red_t {
	U reject;
	U error;
	U delay;
} RED;
typedef struct predd {
	U type;
	RED delays[1];
} PREDD;
#define HASH_BIT 0xfff
#define TransStE 255

#ifdef __cplusplus
extern "C" {
#endif
void  rmaPropagate0(UB  * pcode, scalar  val);
void  rmaPropagate0f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate0r(UB  * pcode);
void  rmaPropagate1(UB  * pcode, scalar  val);
void  rmaPropagate1f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate1r(UB  * pcode);
void  rmaPropagate1t0(UB  * pcode, UB  val);
void  rmaPropagate2(UB  * pcode, scalar  val);
void  rmaPropagate2f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate2r(UB  * pcode);
void  rmaPropagate3(UB  * pcode, scalar  val);
void  rmaPropagate3f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate3r(UB  * pcode);
void  rmaPropagate3t0(UB  * pcode, UB  val);
void  rmaPropagate4(UB  * pcode, scalar  val);
void  rmaPropagate4f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate4r(UB  * pcode);
void  rmaPropagate4t0(UB  * pcode, UB  val);
void  rmaPropagate5(UB  * pcode, scalar  val);
void  rmaPropagate5f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate5r(UB  * pcode);
void  rmaPropagate5t0(UB  * pcode, UB  val);
void  rmaPropagate6(UB  * pcode, scalar  val);
void  rmaPropagate6f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate6r(UB  * pcode);
void  rmaPropagate6t0(UB  * pcode, UB  val);
void  rmaPropagate7(UB  * pcode, scalar  val);
void  rmaPropagate7f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate7r(UB  * pcode);
void  rmaPropagate7t0(UB  * pcode, UB  val);
void  rmaPropagate8(UB  * pcode, scalar  val);
void  rmaPropagate8f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate8r(UB  * pcode);
void  rmaPropagate8t0(UB  * pcode, UB  val);
void  rmaPropagate9(UB  * pcode, scalar  val);
void  rmaPropagate9f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate9r(UB  * pcode);
void  rmaPropagate9t0(UB  * pcode, UB  val);
void  rmaPropagate10(UB  * pcode, scalar  val);
void  rmaPropagate10f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate10r(UB  * pcode);
void  rmaPropagate11(UB  * pcode, scalar  val);
void  rmaPropagate11f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate11r(UB  * pcode);
void  rmaPropagate12(UB  * pcode, scalar  val);
void  rmaPropagate12f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate12r(UB  * pcode);
void  rmaPropagate12t0(UB  * pcode, UB  val);
void  rmaPropagate13(UB  * pcode, scalar  val);
void  rmaPropagate13f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate13r(UB  * pcode);
void  rmaPropagate13t0(UB  * pcode, UB  val);
void  rmaPropagate14(UB  * pcode, scalar  val);
void  rmaPropagate15(UB  * pcode, scalar  val);
void  rmaPropagate15f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate15r(UB  * pcode);
void  rmaPropagate15t0(UB  * pcode, UB  val);
void  rmaPropagate16(UB  * pcode, scalar  val);
void  rmaPropagate16f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate16r(UB  * pcode);
void  rmaPropagate16t0(UB  * pcode, UB  val);
void  rmaPropagate17(UB  * pcode, scalar  val);
void  rmaPropagate17f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate17r(UB  * pcode);
void  rmaPropagate17t0(UB  * pcode, UB  val);
void  rmaPropagate18(UB  * pcode, scalar  val);
void  rmaPropagate18f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate18r(UB  * pcode);
void  rmaPropagate18t0(UB  * pcode, UB  val);
void  rmaPropagate19(UB  * pcode, scalar  val);
void  rmaPropagate19f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate19r(UB  * pcode);
void  rmaPropagate19t0(UB  * pcode, UB  val);
void  rmaPropagate20(UB  * pcode, scalar  val);
void  rmaPropagate20f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate20r(UB  * pcode);
void  rmaPropagate20t0(UB  * pcode, UB  val);
void  rmaPropagate21(UB  * pcode, scalar  val);
void  rmaPropagate21f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate21r(UB  * pcode);
void  rmaPropagate21t0(UB  * pcode, UB  val);
void  rmaPropagate22(UB  * pcode, scalar  val);
void  rmaPropagate22f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate22r(UB  * pcode);
void  rmaPropagate22t0(UB  * pcode, UB  val);
void  rmaPropagate23(UB  * pcode, scalar  val);
void  rmaPropagate23f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate23r(UB  * pcode);
void  rmaPropagate23t0(UB  * pcode, UB  val);
void  rmaPropagate24(UB  * pcode, scalar  val);
void  rmaPropagate24f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate24r(UB  * pcode);
void  rmaPropagate24t0(UB  * pcode, UB  val);
void  rmaPropagate25(UB  * pcode, scalar  val);
void  rmaPropagate25f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate25r(UB  * pcode);
void  rmaPropagate26(UB  * pcode, scalar  val);
void  rmaPropagate26f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate26r(UB  * pcode);
void  rmaPropagate26t0(UB  * pcode, UB  val);
void  rmaPropagate27(UB  * pcode, scalar  val);
void  rmaPropagate27f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate27r(UB  * pcode);
void  rmaPropagate27t0(UB  * pcode, UB  val);
void  rmaPropagate28(UB  * pcode, scalar  val);
void  rmaPropagate28f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate28r(UB  * pcode);
void  rmaPropagate28t0(UB  * pcode, UB  val);
void  rmaPropagate29(UB  * pcode, scalar  val);
void  rmaPropagate29f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate29r(UB  * pcode);
void  rmaPropagate29t0(UB  * pcode, UB  val);
void  rmaPropagate30(UB  * pcode, scalar  val);
void  rmaPropagate30f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate30r(UB  * pcode);
void  rmaPropagate30t0(UB  * pcode, UB  val);
void  rmaPropagate31(UB  * pcode, scalar  val);
void  rmaPropagate31f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate31r(UB  * pcode);
void  rmaPropagate31t0(UB  * pcode, UB  val);
void  rmaPropagate32(UB  * pcode, scalar  val);
void  rmaPropagate32t0(UB  * pcode, UB  val);
void  rmaPropagate33(UB  * pcode, scalar  val);
void  rmaPropagate33f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate33r(UB  * pcode);
void  rmaPropagate33t0(UB  * pcode, UB  val);
void  rmaPropagate34(UB  * pcode, scalar  val);
void  rmaPropagate34f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate34r(UB  * pcode);
void  rmaPropagate35(UB  * pcode, scalar  val);
void  rmaPropagate35f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate35r(UB  * pcode);
void  rmaPropagate35t0(UB  * pcode, UB  val);
void  rmaPropagate36(UB  * pcode, scalar  val);
void  rmaPropagate36f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate36r(UB  * pcode);
void  rmaPropagate36t0(UB  * pcode, UB  val);
void  rmaPropagate39(UB  * pcode, scalar  val);
void  rmaPropagate39f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate39r(UB  * pcode);
void  rmaPropagate40(UB  * pcode, scalar  val);
void  rmaPropagate40f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate40r(UB  * pcode);
void  rmaPropagate41(UB  * pcode, scalar  val);
void  rmaPropagate41f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate41r(UB  * pcode);
void  rmaPropagate44(UB  * pcode, scalar  val);
void  rmaPropagate45(UB  * pcode, scalar  val);
void  rmaPropagate46(UB  * pcode, scalar  val);
void  rmaPropagate46f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate46r(UB  * pcode);
void  rmaPropagate46s0(UB  * pcode, scalar  val);
void  rmaPropagate53(UB  * pcode, scalar  val);
void  rmaPropagate53f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate53r(UB  * pcode);
void  rmaPropagate53s0(UB  * pcode, scalar  val);
void  rmaPropagate54(UB  * pcode, scalar  val);
void  rmaPropagate54f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate54r(UB  * pcode);
void  rmaPropagate56(UB  * pcode, scalar  val);
void  rmaPropagate56f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate56r(UB  * pcode);
void  rmaPropagate57(UB  * pcode, scalar  val);
void  rmaPropagate66(UB  * pcode, scalar  val);
void  rmaPropagate66f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate66r(UB  * pcode);
void  rmaPropagate67(UB  * pcode, scalar  val);
void  rmaPropagate67f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate67r(UB  * pcode);
void  rmaPropagate68(UB  * pcode, scalar  val);
void  rmaPropagate68f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate68r(UB  * pcode);
void  rmaPropagate69(UB  * pcode, scalar  val);
void  rmaPropagate69f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate69r(UB  * pcode);
void  rmaPropagate70(UB  * pcode, scalar  val);
void  rmaPropagate70f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate70r(UB  * pcode);
void  rmaPropagate71(UB  * pcode, scalar  val);
void  rmaPropagate71f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate71r(UB  * pcode);
void  rmaPropagate72(UB  * pcode, scalar  val);
void  rmaPropagate72f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate72r(UB  * pcode);
void  rmaPropagate72wn(UB  * pcode, scalar  val);
void  rmaPropagate73(UB  * pcode, scalar  val);
void  rmaPropagate73f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate73r(UB  * pcode);
void  rmaPropagate74(UB  * pcode, scalar  val);
void  rmaPropagate74f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate74r(UB  * pcode);
void  rmaPropagate75(UB  * pcode, scalar  val);
void  rmaPropagate75f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate75r(UB  * pcode);
void  rmaPropagate76(UB  * pcode, scalar  val);
void  rmaPropagate76f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate76r(UB  * pcode);
void  rmaPropagate77(UB  * pcode, scalar  val);
void  rmaPropagate77f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate77r(UB  * pcode);
void  rmaPropagate78(UB  * pcode, scalar  val);
void  rmaPropagate78f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate78r(UB  * pcode);
void  rmaPropagate78wn(UB  * pcode, scalar  val);
void  rmaPropagate79(UB  * pcode, scalar  val);
void  rmaPropagate79f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate79r(UB  * pcode);
void  rmaPropagate79wn(UB  * pcode, scalar  val);
void  rmaPropagate80(UB  * pcode, scalar  val);
void  rmaPropagate80f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate80r(UB  * pcode);
void  rmaPropagate80wn(UB  * pcode, scalar  val);
void  rmaPropagate81(UB  * pcode, scalar  val);
void  rmaPropagate81f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate81r(UB  * pcode);
void  rmaPropagate81wn(UB  * pcode, scalar  val);
void  rmaPropagate82(UB  * pcode, scalar  val);
void  rmaPropagate82f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate82r(UB  * pcode);
void  rmaPropagate88(UB  * pcode, scalar  val);
void  rmaPropagate88f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate88r(UB  * pcode);
void  rmaPropagate88t0(UB  * pcode, UB  val);
void  rmaPropagate89(UB  * pcode, scalar  val);
void  rmaPropagate89f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate89r(UB  * pcode);
void  rmaPropagate90(UB  * pcode, scalar  val);
void  rmaPropagate90f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate90r(UB  * pcode);
void  rmaPropagate91(UB  * pcode, scalar  val);
void  rmaPropagate91f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate91r(UB  * pcode);
void  rmaPropagate92(UB  * pcode, scalar  val);
void  rmaPropagate92f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate92r(UB  * pcode);
void  rmaPropagate93(UB  * pcode, scalar  val);
void  rmaPropagate93f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate93r(UB  * pcode);
void  rmaPropagate94(UB  * pcode, scalar  val);
void  rmaPropagate94f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate94r(UB  * pcode);
void  rmaPropagate95(UB  * pcode, scalar  val);
void  rmaPropagate95f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate95r(UB  * pcode);
void  rmaPropagate96(UB  * pcode, scalar  val);
void  rmaPropagate96f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate96r(UB  * pcode);
void  rmaPropagate96wn(UB  * pcode, scalar  val);
void  rmaPropagate97(UB  * pcode, scalar  val);
void  rmaPropagate97f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate97r(UB  * pcode);
void  rmaPropagate98(UB  * pcode, scalar  val);
void  rmaPropagate98f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate98r(UB  * pcode);
void  rmaPropagate99(UB  * pcode, scalar  val);
void  rmaPropagate99f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate99r(UB  * pcode);
void  rmaPropagate100(UB  * pcode, scalar  val);
void  rmaPropagate100f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate100r(UB  * pcode);
void  rmaPropagate101(UB  * pcode, scalar  val);
void  rmaPropagate101f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate101r(UB  * pcode);
void  rmaPropagate102(UB  * pcode, scalar  val);
void  rmaPropagate102f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate102r(UB  * pcode);
void  rmaPropagate103(UB  * pcode, scalar  val);
void  rmaPropagate103f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate103r(UB  * pcode);
void  rmaPropagate103wn(UB  * pcode, scalar  val);
void  rmaPropagate104(UB  * pcode, scalar  val);
void  rmaPropagate104f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate104r(UB  * pcode);
void  rmaPropagate104wn(UB  * pcode, scalar  val);
void  rmaPropagate105(UB  * pcode, scalar  val);
void  rmaPropagate105f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate105r(UB  * pcode);
void  rmaPropagate105wn(UB  * pcode, scalar  val);
void  rmaPropagate106(UB  * pcode, scalar  val);
void  rmaPropagate106f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate106r(UB  * pcode);
void  rmaPropagate107(UB  * pcode, scalar  val);
void  rmaPropagate107f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate107r(UB  * pcode);
void  rmaPropagate108(UB  * pcode, scalar  val);
void  rmaPropagate108f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate108r(UB  * pcode);
void  rmaPropagate109(UB  * pcode, scalar  val);
void  rmaPropagate109f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate109r(UB  * pcode);
void  rmaPropagate109wn(UB  * pcode, scalar  val);
void  rmaPropagate110(UB  * pcode, scalar  val);
void  rmaPropagate110f(UB  * pcode, scalar  val, U  frhs, scalar  * prhs);
void  rmaPropagate110r(UB  * pcode);
void  rmaPropagate111(UB  * pcode, scalar  val);
void  schedNewEvent(struct dummyq_struct * pQ, EBLK  * peblk, U  delay);
#ifdef __cplusplus
}
#endif
void  schedNewEvent(struct dummyq_struct * pQ, EBLK  * peblk, U  delay);
void  schedNewEvent(struct dummyq_struct * pQ, EBLK  * peblk, U  delay)
{
    U  abs_t;
    U  thigh_abs;
    U  hash_index;
    struct futq * pfutq;
    abs_t = ((U )vcs_clocks) + delay;
    hash_index = abs_t & 0xfff;
    peblk->peblkFlink = (EBLK  *)(-1);
    peblk->t = abs_t;
    if (abs_t < (U )vcs_clocks) {
        thigh_abs = ((U  *)&vcs_clocks)[1];
        sched_millenium(pQ, peblk, thigh_abs + 1, abs_t);
    }
    else if ((pfutq = pQ->hashtab[hash_index].tfutq)) {
        peblk->peblkPrv = pfutq->peblkTail;
        pfutq->peblkTail->peblkFlink = peblk;
        pfutq->peblkTail = peblk;
    }
    else {
        sched_hsopt(pQ, peblk, abs_t);
    }
}
#ifdef __cplusplus
extern "C" {
#endif
void SinitHsimPats(void);
#ifdef __cplusplus
}
#endif
