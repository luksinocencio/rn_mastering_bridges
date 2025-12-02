import React from 'react';
import {
  Text as RNText,
  TextProps as RNTextProps,
  TextStyle,
} from 'react-native';

/**
 * Presets de tipografia disponíveis no componente DSText.
 *
 * Use para garantir consistência visual no Design System.
 *
 * Legenda dos tamanhos:
 *
 * - `headingLarge` → fontSize: 32, lineHeight: 38.4
 * - `headingMedium` → fontSize: 22, lineHeight: 26.4
 * - `headingSmall` → fontSize: 18, lineHeight: 23.4
 *
 * - `paragraphLarge` → fontSize: 18, lineHeight: 25.2
 * - `paragraphMedium` → fontSize: 16, lineHeight: 22.4
 * - `paragraphSmall` → fontSize: 14, lineHeight: 19.6
 *
 * - `paragraphCaption` → fontSize: 12, lineHeight: 16.8
 * - `paragraphCaptionSmall` → fontSize: 10, lineHeight: 14
 *
 * Recomendações de uso:
 *
 * - `headingLarge/Medium/Small` → títulos e cabeçalhos.
 * - `paragraphLarge/Medium/Small` → textos de conteúdo em geral.
 * - `paragraphCaption` → textos auxiliares, legendas, labels.
 * - `paragraphCaptionSmall` → microtextos, dicas sutis, disclaimers.
 */
export type TextVariants =
  | 'headingLarge'
  | 'headingMedium'
  | 'headingSmall'
  | 'paragraphLarge'
  | 'paragraphMedium'
  | 'paragraphSmall'
  | 'paragraphCaption'
  | 'paragraphCaptionSmall';

/**
 * Propriedades do componente DSText.
 *
 * Baseado em `React Native TextProps`, com algumas
 * extensões para facilitar o uso dentro do Design System.
 */
export interface DSTextProps extends RNTextProps {
  /**
   * Define o estilo tipográfico base do texto.
   *
   * Exemplos:
   *
   * - `"headingLarge"` → Título principal (32 / 38.4)
   * - `"headingMedium"` → Título de seção (22 / 26.4)
   * - `"paragraphMedium"` → Texto padrão do app (16 / 22.4)
   * - `"paragraphCaptionSmall"` → Microtexto / legenda (10 / 14)
   *
   * @default "paragraphMedium"
   */
  preset?: TextVariants;

  /**
   * Aplica negrito ao texto.
   *
   * - Internamente usa `fontWeight: "700"`.
   * - Tem prioridade sobre `semiBold` quando ambos são `true`.
   */
  bold?: boolean;

  /**
   * Aplica semibold ao texto.
   *
   * - Internamente usa `fontWeight: "600"`.
   * - Ignorado se `bold` também estiver `true`.
   */
  semiBold?: boolean;

  /**
   * Aplica itálico ao texto.
   *
   * - Internamente usa `fontStyle: "italic"`.
   */
  italic?: boolean;
}

/**
 * Mapa de tamanhos de fonte e line-height para cada preset tipográfico.
 *
 * Mantém o contrato do Design System para garantir consistência em todo o app.
 */
const fontSizes: Record<TextVariants, TextStyle> = {
  headingLarge: { fontSize: 32, lineHeight: 38.4 },
  headingMedium: { fontSize: 22, lineHeight: 26.4 },
  headingSmall: { fontSize: 18, lineHeight: 23.4 },

  paragraphLarge: { fontSize: 18, lineHeight: 25.2 },
  paragraphMedium: { fontSize: 16, lineHeight: 22.4 },
  paragraphSmall: { fontSize: 14, lineHeight: 19.6 },

  paragraphCaption: { fontSize: 12, lineHeight: 16.8 },
  paragraphCaptionSmall: { fontSize: 10, lineHeight: 14 },
};

/**
 * Determina o `fontWeight` com base no preset e nas flags
 * `bold` e `semiBold`.
 *
 * - Headings são bold por padrão.
 * - `bold` tem prioridade sobre `semiBold`.
 */
function getFontWeight({
  preset,
  bold,
  semiBold,
}: {
  preset: TextVariants;
  bold?: boolean;
  semiBold?: boolean;
}): TextStyle['fontWeight'] {
  // headings por padrão bold
  if (
    preset === 'headingLarge' ||
    preset === 'headingMedium' ||
    preset === 'headingSmall'
  ) {
    return '700';
  }

  if (bold) return '700';
  if (semiBold) return '600';

  return '400';
}

/**
 * Determina o `fontStyle` com base na flag `italic`.
 */
function getFontStyle(italic?: boolean): TextStyle['fontStyle'] {
  return italic ? 'italic' : 'normal';
}

/**
 * Componente de texto padronizado do Design System.
 *
 * Vantagens:
 * - Mantém consistência visual de tipografia em todo o app.
 * - Abstrai `fontSize`, `lineHeight`, `fontWeight` e `fontStyle`
 *   em um conjunto de presets semânticos.
 * - Extende `TextProps` do React Native, então você ainda pode
 *   usar todas as props padrão (`numberOfLines`, `ellipsizeMode`, etc.).
 *
 * Exemplos de uso:
 *
 * ```tsx
 * // Título principal
 * <DSText preset="headingLarge" bold>
 *   Dashboard
 * </DSText>
 *
 * // Texto padrão
 * <DSText>
 *   Este é um parágrafo padrão usando "paragraphMedium".
 * </DSText>
 *
 * // Legenda em itálico
 * <DSText preset="paragraphCaption" italic>
 *   Atualizado há 5 minutos
 * </DSText>
 *
 * // Sobrescrevendo estilos manualmente
 * <DSText preset="paragraphSmall" style={{ color: 'red' }}>
 *   Texto de erro
 * </DSText>
 * ```
 */
export function DSText({
  children,
  preset = 'paragraphMedium',
  bold,
  semiBold,
  italic,
  style,
  ...rest
}: DSTextProps) {
  const baseSizeStyle = fontSizes[preset];

  const dynamicStyle: TextStyle = {
    fontWeight: getFontWeight({ preset, bold, semiBold }),
    fontStyle: getFontStyle(italic),
  };

  return (
    <RNText style={[baseSizeStyle, dynamicStyle, style]} {...rest}>
      {children}
    </RNText>
  );
}
