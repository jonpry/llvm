//====- SparcMCExpr.h - Sparc specific MC expression classes --*- C++ -*-=====//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file describes Sparc-specific MCExprs, used for modifiers like
// "%hi" or "%lo" etc.,
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_SPARCMCEXPR_H
#define LLVM_SPARCMCEXPR_H

#include "llvm/MC/MCExpr.h"

namespace llvm {

class SparcMCExpr : public MCTargetExpr {
public:
  enum VariantKind {
    VK_Sparc_None,
    VK_Sparc_LO,
    VK_Sparc_HI,
    VK_Sparc_H44,
    VK_Sparc_M44,
    VK_Sparc_L44,
    VK_Sparc_HH,
    VK_Sparc_HM,
    VK_Sparc_TLS_GD_HI22,
    VK_Sparc_TLS_GD_LO10,
    VK_Sparc_TLS_GD_ADD,
    VK_Sparc_TLS_GD_CALL,
    VK_Sparc_TLS_LDM_HI22,
    VK_Sparc_TLS_LDM_LO10,
    VK_Sparc_TLS_LDM_ADD,
    VK_Sparc_TLS_LDM_CALL,
    VK_Sparc_TLS_LDO_HIX22,
    VK_Sparc_TLS_LDO_LOX10,
    VK_Sparc_TLS_LDO_ADD,
    VK_Sparc_TLS_IE_HI22,
    VK_Sparc_TLS_IE_LO10,
    VK_Sparc_TLS_IE_LD,
    VK_Sparc_TLS_IE_LDX,
    VK_Sparc_TLS_IE_ADD,
    VK_Sparc_TLS_LE_HIX22,
    VK_Sparc_TLS_LE_LOX10
  };

private:
  const VariantKind Kind;
  const MCExpr *Expr;

  explicit SparcMCExpr(VariantKind _Kind, const MCExpr *_Expr)
    : Kind(_Kind), Expr(_Expr) {}

public:
  /// @name Construction
  /// @{

  static const SparcMCExpr *Create(VariantKind Kind, const MCExpr *Expr,
                                 MCContext &Ctx);
  /// @}
  /// @name Accessors
  /// @{

  /// getOpcode - Get the kind of this expression.
  VariantKind getKind() const { return Kind; }

  /// getSubExpr - Get the child of this expression.
  const MCExpr *getSubExpr() const { return Expr; }

  /// @}
  void PrintImpl(raw_ostream &OS) const;
  bool EvaluateAsRelocatableImpl(MCValue &Res,
                                 const MCAsmLayout *Layout) const;
  void AddValueSymbols(MCAssembler *) const;
  const MCSection *FindAssociatedSection() const {
    return getSubExpr()->FindAssociatedSection();
  }

  void fixELFSymbolsInTLSFixups(MCAssembler &Asm) const;

  static bool classof(const MCExpr *E) {
    return E->getKind() == MCExpr::Target;
  }

  static bool classof(const SparcMCExpr *) { return true; }


};

} // end namespace llvm.

#endif
