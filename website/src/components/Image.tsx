import { ImageLoader, ImageProps } from "next/image";
import NextImage from "next/image";
import { useWindowSize } from "@/hooks/useWindowSize";

const myLoader: ImageLoader = ({ src }) => {
  return src;
};

type BreakPoints = {
  xs: string | number;
  sm?: string | number;
  md?: string | number;
};

type ImgProps = Omit<ImageProps, "width" | "height"> & {
  width: string | number | BreakPoints;
  height: string | number | BreakPoints;
};

const determineSize = (width: number, breakpoints: BreakPoints): string | number => {
  if (width >= 900 && breakpoints.md) {
    return breakpoints.md;
  } else if (width >= 600 && breakpoints.sm) {
    return breakpoints.sm;
  }
  return breakpoints.xs;
};

export const Image = (props: ImgProps) => {
  const windowsSize = useWindowSize();

  let width: string | number = "";
  let height: string | number = "";

  if (typeof props.width === "string" || typeof props.width === "number") {
    width = props.width;
  } else {
    width = determineSize(windowsSize.width, props.width);
  }

  if (typeof props.height === "string" || typeof props.height === "number") {
    height = props.height;
  } else {
    height = determineSize(windowsSize.width, props.height);
  }

  return <NextImage {...props} loader={myLoader} unoptimized={true} width={width} height={height} />;
};
