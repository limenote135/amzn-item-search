import { ImageLoader, ImageProps } from "next/image";
import NextImage from "next/image";
import { useWindowSize } from "@/hooks/useWindowSize";

const myLoader: ImageLoader = ({ src }) => {
  return src;
};

type BreakPoints = {
  xs: number | `${number}`;
  sm?: number | `${number}`;
  md?: number | `${number}`;
};

type ImgProps = Omit<ImageProps, "width" | "height"> & {
  width?: number | `${number}` | BreakPoints;
  height?: number | `${number}` | BreakPoints;
};

const determineSize = (width: number, breakpoints: BreakPoints): number | `${number}` => {
  if (width >= 900 && breakpoints.md) {
    return breakpoints.md;
  } else if (width >= 600 && breakpoints.sm) {
    return breakpoints.sm;
  }
  return breakpoints.xs;
};

export const Image = (props: ImgProps) => {
  const windowsSize = useWindowSize();

  let width: number | `${number}` | undefined = undefined;
  let height: number | `${number}` | undefined = undefined;

  if (typeof props.width === "object") {
    width = determineSize(windowsSize.width, props.width);
  } else {
    width = props.width;
  }

  if (typeof props.height === "object") {
    height = determineSize(windowsSize.width, props.height);
  } else {
    height = props.height;
  }

  return <NextImage {...props} loader={myLoader} unoptimized={true} width={width} height={height} />;
};
