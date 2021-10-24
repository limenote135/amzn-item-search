import { Box, Container, Typography, Button } from "@mui/material";

import type { NextPage } from "next";

import Link from "@/components/Link";

const Index: NextPage = () => {
  return (
    <Container maxWidth="sm">
      <Box sx={{ my: 4 }}>
        <Typography variant="h4" component="h1" gutterBottom>
          Next.js v5-beta with TypeScript example
        </Typography>

        <Link href="/about" color="secondary">
          Go to the about page
        </Link>
      </Box>
      <Box>
        <Button variant="contained" color="primary">
          Css
        </Button>
        <Button variant="contained">Css</Button>
      </Box>
    </Container>
  );
};

export default Index;
